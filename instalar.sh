#!/usr/bin/env bash
# =============================================================================
#  Odoo 16 — atalho para o instalador central
#
#  O instalador é mantido em:
#    https://github.com/ronaldopadula/odoo-15-br-docker-compose
#  que instala o Odoo (versões 14 a 19) com o mesmo script, de forma segura.
#
#  Este arquivo apenas baixa o instalador de lá e o executa com VERSAO=16.
#  Uso (igual ao do instalador central):
#    sudo bash instalar.sh <pasta> <porta> [base_inicial]
# =============================================================================
set -euo pipefail
URL="https://raw.githubusercontent.com/ronaldopadula/odoo-15-br-docker-compose/${REF:-master}/instalar.sh"
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT
command -v curl >/dev/null || { echo "ERRO: instale o curl (apt-get install -y curl)." >&2; exit 1; }
curl -fsSL "$URL" -o "$TMP" || { echo "ERRO: não foi possível baixar $URL" >&2; exit 1; }
VERSAO=16 bash "$TMP" "$@"
