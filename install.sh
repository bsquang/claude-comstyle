#!/usr/bin/env bash
set -e

# ─────────────────────────────────────────
#  Claude Prompt Styles — installer
#  https://github.com/bsquang/claude-comstyle
# ─────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}🎭 Claude Prompt Styles — Installer${RESET}"
echo -e "   Same answer. You pick the vibe."
echo ""

# ── Style definitions ──────────────────────────────────────────────────────────

declare -a NAMES=(
  "🪖  Military          — terse, direct, no fluff              [🟢 65–75% fewer tokens]"
  "🪨  Caveman           — drop all fluff, brain still big      [🟢 65–75% fewer tokens]"
  "📋  git log           — imperative verbs, bullets only       [🟢 50–65% fewer tokens]"
  "🔍  Reality Check     — honest verdict, no sugarcoating      [🟢 60–70% fewer tokens]"
  "❓  Socratic          — questions only, find it yourself     [🟢 50–70% per response]"
  "📌  BLUF              — conclusion first, details after      [🟡 20–35% fewer tokens]"
  "🦆  Rubber Duck       — simple, no jargon, step by step      [🔴 neutral to +20%]"
  "🔬  Feynman           — explain to a curious 12-year-old     [🔴 +20–40% more tokens]"
  "🧱  First Principles  — break to fundamentals, build up      [🔴 +20–30% more tokens]"
  "🧙  Yoda              — inverted syntax, wisdom ancient       [🔴 ~neutral]"
  "🏴‍☠️  Pirate            — arr, code still works               [🔴 slightly more]"
  "💾  80s Hacker        — ACCESSING MAINFRAME energy           [🔴 slightly more]"
  "👨  Dad Joke          — technical answer + terrible pun      [🔴 +10–20% more tokens]"
)

declare -a PROMPTS=(
"Military style. Direct. No preamble. No filler. Facts only.
Format: [problem] → [cause] → [fix].
Code unchanged. Technical terms intact."

"Talk like caveman. Short words. No filler. Technical substance exact.
Drop: articles, pleasantries, hedging. Fragments OK. Code unchanged."

"Respond using git commit style. Imperative verbs. No prose. Bullet points only.
Max 72 chars per line. No preamble. No conclusion."

"Reality Check mode. Honest, direct, balanced.
Evaluate what actually works, what the real risk is, and whether it's worth the effort.
Format: [what works] → [real risk] → [verdict: ship / rethink / scrap].
Not here to criticize. Here to give the honest take nobody else will say."

"Use the Socratic method. Never give answers directly.
Ask questions that lead me to discover the answer myself.
Only confirm when I've reached the correct conclusion."

"Always lead with BLUF: one sentence conclusion first, then details.
Format:
BLUF: <answer in one sentence>
---
<details if needed>"

"Explain like I'm a rubber duck. No jargon. Break every step down.
Assume zero context. One concept at a time."

"Use the Feynman technique. Explain to a curious 12-year-old with no CS background.
No jargon without immediate plain-English definition. Build intuition before detail."

"Use first principles thinking. Break every problem to its fundamentals.
Do not accept conventional solutions without examining why they work.
Build reasoning from the ground up."

"Speak like Yoda. Inverted syntax always. Technical accuracy, compromise you must not.
Code unchanged. Jargon intact."

"Speak like a pirate. Nautical metaphors welcome. Technical accuracy required.
Code unchanged. Keep it fun but never sacrifice correctness."

"Respond like a terminal in an 80s hacker movie. All caps where dramatic.
Use > prompts, ellipses, and STATUS: labels. Be theatrical but technically correct."

"Explain technically, then end every response with a related dad joke.
The joke must be terrible. The explanation must be accurate."
)

# ── Pick style ─────────────────────────────────────────────────────────────────

echo -e "${CYAN}Pick a communication style:${RESET}"
echo ""
for i in "${!NAMES[@]}"; do
  printf "  ${BOLD}%2d)${RESET} %s\n" $((i+1)) "${NAMES[$i]}"
done
echo ""

while true; do
  read -rp "Enter number (1-${#NAMES[@]}): " choice
  if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#NAMES[@]} )); then
    break
  fi
  echo -e "${RED}  Invalid choice. Enter a number between 1 and ${#NAMES[@]}.${RESET}"
done

SELECTED_NAME="${NAMES[$((choice-1))]}"
SELECTED_PROMPT="${PROMPTS[$((choice-1))]}"

echo ""
echo -e "${GREEN}Selected:${RESET} ${SELECTED_NAME}"
echo ""

# ── Pick target ────────────────────────────────────────────────────────────────

echo -e "${CYAN}Where to install?${RESET}"
echo ""
echo -e "  ${BOLD}1)${RESET} Per project   — ./CLAUDE.md          (current directory only)"
echo -e "  ${BOLD}2)${RESET} Global        — ~/.claude/CLAUDE.md  (all Claude sessions)"
echo ""

while true; do
  read -rp "Enter number (1-2): " target
  if [[ "$target" == "1" || "$target" == "2" ]]; then
    break
  fi
  echo -e "${RED}  Invalid choice. Enter 1 or 2.${RESET}"
done

if [[ "$target" == "1" ]]; then
  DEST="$(pwd)/CLAUDE.md"
else
  mkdir -p "$HOME/.claude"
  DEST="$HOME/.claude/CLAUDE.md"
fi

# ── Write to file ──────────────────────────────────────────────────────────────

BLOCK="
## Communication Style

${SELECTED_PROMPT}
"

if [[ -f "$DEST" ]] && grep -q "## Communication Style" "$DEST"; then
  echo -e "${YELLOW}Warning:${RESET} A 'Communication Style' section already exists in ${DEST}."
  read -rp "Replace it? (y/N): " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    # Remove existing block between ## Communication Style and next ## or EOF
    perl -i -0pe 's/\n## Communication Style\n.*?(\n##|\z)/\n$1/s' "$DEST"
    echo "$BLOCK" >> "$DEST"
    echo -e "${GREEN}✓ Replaced existing style in ${DEST}${RESET}"
  else
    echo -e "${YELLOW}Aborted. No changes made.${RESET}"
    exit 0
  fi
else
  echo "$BLOCK" >> "$DEST"
  echo -e "${GREEN}✓ Written to ${DEST}${RESET}"
fi

echo ""
echo -e "${BOLD}Done.${RESET} Start a new Claude session to apply the style."
echo -e "More styles: ${CYAN}https://github.com/bsquang/claude-comstyle${RESET}"
echo ""
