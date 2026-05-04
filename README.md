# Ghost (Node.js) Publishing Security

<div align="center">
  <p>Elite B2B Security & Operations Configurations for Ghost Publishing Platforms.</p>
  <p>
    <a href="#-english">🇺🇸 English</a> | 
    <a href="#-português">🇧🇷 Português</a>
  </p>
</div>

---

## 🇺🇸 English

### High-Tier Publishing Infrastructure
This repository contains the official **TAVARDT Agency** hardening templates for corporate publishing environments built on Ghost (Node.js). Ghost is exceptionally fast and bypasses traditional PHP vulnerabilities, but it requires strict reverse proxy architecture and precise Node/Linux permission management to remain stable and secure.

### Contents
- **`nginx-ghost-secure.conf`**: Nginx reverse proxy rules. Crucially implements rate-limiting against the `/ghost/` admin panel to destroy brute-force attacks instantly, and strips revealing headers (like `X-Powered-By`).
- **`config-hardening.json`**: An enterprise-grade baseline for `config.production.json`.
- **`ghost-safe-update.sh`**: A critical operational script. The number one cause of Ghost crashes is administrators running updates as the `root` user, which corrupts Node permissions. This script enforces execution as an unprivileged user, sanitizes permissions, and enforces backups before applying Node packages.

### Implementation Guide
1. Merge the `nginx-ghost-secure.conf` blocks into your server's Nginx configuration. Do not expose port 2368 directly to the public internet.
2. The `ghost-safe-update.sh` must be executed by your dedicated ghost management user (e.g., `ghost-mgr`), NEVER as `root`.

### Contact & Services
Looking for elite B2B infrastructure and high-ticket digital engineering?
- **Website:** [ag.tavardt.com](https://ag.tavardt.com/)
- **Email:** contact@tavardt.com

---

## 🇧🇷 Português

### Infraestrutura de Publicação B2B
Este repositório contém os templates oficiais de "Hardening" (blindagem) da **TAVARDT** para ambientes de publicação corporativa construídos com o Ghost (Node.js). O Ghost é excepcionalmente rápido e imune a vulnerabilidades tradicionais do PHP, mas exige uma arquitetura estrita de proxy reverso e gerenciamento preciso de permissões Node/Linux para se manter estável e seguro.

### Conteúdo
- **`nginx-ghost-secure.conf`**: Regras de proxy reverso Nginx. Crucialmente, implementa *Rate Limiting* (Limite de Taxa) contra o painel administrativo `/ghost/` para destruir ataques de força bruta instantaneamente, e remove cabeçalhos reveladores (como `X-Powered-By`).
- **`config-hardening.json`**: Um modelo corporativo para a base do `config.production.json`.
- **`ghost-safe-update.sh`**: Um script operacional crítico. A causa número 1 de quedas de sites Ghost é o administrador executar atualizações com o usuário `root`, corrompendo as permissões do Node. Este script impõe a execução por um usuário comum, corrige permissões e força a criação de backups antes de aplicar os pacotes.

### Guia de Implementação
1. Mescle os blocos do `nginx-ghost-secure.conf` na configuração do seu Nginx. Nunca exponha a porta 2368 diretamente para a internet pública.
2. O `ghost-safe-update.sh` deve ser executado pelo seu usuário dedicado de gerenciamento do ghost (ex: `ghost-mgr`), NUNCA como `root`.

### Contato & Serviços
Procurando por infraestrutura B2B de elite e engenharia digital high-ticket?
- **Site:** [ag.tavardt.com/br/](https://ag.tavardt.com/br/)
- **E-mail:** contato@tavardt.com
