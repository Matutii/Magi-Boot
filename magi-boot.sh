#!/usr/bin/env bash
#
# magi-boot.sh — simula el arranque del sistema MAGI (Neon Genesis Evangelion)
#
# Uso: ./magi-boot.sh
#

set -euo pipefail

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

type_out() {
  # Efecto de escritura letra por letra
  local text="$1"
  local delay="${2:-0.015}"
  for ((i = 0; i < ${#text}; i++)); do
    printf "%s" "${text:$i:1}"
    sleep "$delay"
  done
  echo
}

pause() {
  sleep "${1:-0.4}"
}

clear
echo -e "${CYAN}${BOLD}"
echo "============================================"
echo "   NERV TECHNICAL DIVISION — MAGI SYSTEM"
echo "============================================"
echo -e "${NC}"
pause 0.6

type_out "INITIALIZING MAGI SYSTEM..." 0.02
pause 0.5

echo
echo -e "${BOLD}Booting supercomputers:${NC}"
pause 0.3

# Melchior
printf "  MELCHIOR-1 %-14s" "[SCIENTIST]"
pause 0.6
echo -e "${GREEN}ONLINE${NC}"

# Balthasar
printf "  BALTHASAR-2 %-14s" "[MOTHER]"
pause 0.8
echo -e "${GREEN}ONLINE${NC}"

# Casper — con un poco de suspenso random
printf "  CASPER-3 %-14s" "[WOMAN]"
pause 1.2
if (( RANDOM % 10 < 8 )); then
  echo -e "${GREEN}ONLINE${NC}"
  CASPER_OK=1
else
  echo -e "${ORANGE}DELAYED RESPONSE...${NC}"
  CASPER_OK=0
fi

echo
pause 0.5

type_out "Requesting consensus vote..." 0.02
pause 0.6

if [[ "${CASPER_OK:-1}" -eq 1 ]]; then
  echo -e "  ${GREEN}CONSENSUS REACHED: 3/3${NC}"
  pause 0.4
  echo
  echo -e "${GREEN}${BOLD}SYSTEM READY.${NC}"
else
  pause 0.5
  echo -e "  ${GREEN}MELCHIOR-1: APPROVE${NC}"
  echo -e "  ${GREEN}BALTHASAR-2: APPROVE${NC}"
  pause 0.7
  echo -e "  ${ORANGE}CASPER-3: RECALCULATING...${NC}"
  pause 1.0
  echo -e "  ${GREEN}CASPER-3: APPROVE${NC}"
  echo
  echo -e "  ${ORANGE}CONSENSUS REACHED WITH DELAY: 3/3${NC}"
  pause 0.4
  echo
  echo -e "${GREEN}${BOLD}SYSTEM READY.${NC}"
fi

pause 0.6
echo
echo -e "${CYAN}--------------------------------------------${NC}"
type_out "Welcome, ${USER:-Commander}." 0.02
echo -e "${CYAN}--------------------------------------------${NC}"
