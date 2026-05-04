#!/bin/bash
# ----------------------------------------------------------------------
# TAVARDT Elite Ghost CLI Safe Updater
# ----------------------------------------------------------------------
# Description: Running `ghost update` as root destroys Node.js directory 
# permissions and crashes the site. This wrapper script enforces safe 
# execution, enforces database backups, and corrects permissions.
# ----------------------------------------------------------------------

GHOST_DIR="/var/www/ghost"
GHOST_USER="ghost-mgr" # The non-root user that owns the ghost installation

echo "[TAVARDT] Initializing Safe Ghost Update Sequence..."

# 1. Root Execution Block (The "Straitjacket")
if [ "$(id -u)" -eq 0 ]; then
    echo "ERROR: You are running this script as ROOT. This will destroy Ghost."
    echo "Please switch to your ghost management user (e.g., su - $GHOST_USER)"
    exit 1
fi

cd $GHOST_DIR || { echo "Directory not found!"; exit 1; }

# 2. Pre-flight Permission Fix
# Ensures the user running this actually owns the content folder properly.
# (If a previous error happened, this might need sudo, but we assume
#  the ghost user has proper rights to fix their own files).
echo "Verifying permissions..."
find ./content -type d -exec chmod 775 {} \;
find ./content -type f -exec chmod 664 {} \;

# 3. Database & Theme Backup
echo "Initiating Pre-Update Backup..."
ghost backup

if [ $? -ne 0 ]; then
    echo "ERROR: Backup failed. Aborting update to prevent data loss."
    exit 1
fi

# 4. Safe Node.js Application Update
echo "Executing Ghost Core Update..."
ghost update

if [ $? -eq 0 ]; then
    echo "[TAVARDT] Ghost Core successfully updated and restarted."
else
    echo "ERROR: Update encountered an issue. Please review Ghost logs: ghost log"
fi
