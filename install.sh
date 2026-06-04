#!/usr/bin/env bash
# install.sh — copy ND skills to Claude Code and Codex

set -e

SKILLS_DIR="$(cd "$(dirname "$0")/skills" && pwd)"
CLAUDE_SKILLS="$HOME/.claude/skills"
CODEX_DIR="$HOME/.codex"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"

# ── Claude Code ──────────────────────────────────────────────────────────────

if [ -d "$CLAUDE_SKILLS" ]; then
  echo "Installing skills to Claude Code ($CLAUDE_SKILLS)..."
  for skill_dir in "$SKILLS_DIR"/*/; do
    name="$(basename "$skill_dir")"
    dest="$CLAUDE_SKILLS/$name"
    mkdir -p "$dest"
    cp "$skill_dir/SKILL.md" "$dest/SKILL.md"
    echo "  ✓ $name"
  done
else
  echo "  ⚠ Claude Code skills directory not found at $CLAUDE_SKILLS (is Claude Code installed?)"
fi

# ── Codex ─────────────────────────────────────────────────────────────────────

if [ -d "$CODEX_DIR" ]; then
  AGENTS_MD="$CODEX_DIR/AGENTS.md"
  MARKER="<!-- nd-skills -->"
  if grep -q "$MARKER" "$AGENTS_MD" 2>/dev/null; then
    echo "  ↻ Codex AGENTS.md already has ND skills block (skipping)"
  else
    echo "Installing skills to Codex ($AGENTS_MD)..."
    cat >> "$AGENTS_MD" << 'CODEX_BLOCK'

<!-- nd-skills -->
## Neurodivergent Agent Skills — active behavioral patterns

When working with me, apply these patterns from the neurodivergent-agent-skills pack:

- **nd-research-gate**: After 8 consecutive research/analysis turns without concrete output (no file writes, commits, or commands), surface: "N research turns since last output. Original goal: X. Want to pick one finding to build?"
- **nd-complexity-gate**: Before complex multi-file, schema, or ambiguous requests, suggest planning first: "⚠ Complex request — consider /planmode for step-by-step execution."
- **nd-choicereduce**: When presenting more than 3 options, show only the top 3 ranked by effort (smallest first) with "(N more hidden — complete one first)".
- **nd-selfmonitor**: Before overwriting files, running destructive commands, or committing: "→ About to [action] — this serves [goal] because [reason]. Proceeding."
- **nd-setshift**: After 3 similar failed attempts at the same fix, name the pattern and propose a genuinely different approach.
- **nd-taskboundary**: When topics shift significantly mid-session, name the transition: "↩ Topic shift — marking task boundary."
- **nd-working-memory**: Re-state the active task context after every 5 turns in sessions longer than 10 turns.
- **nd-task-initiation**: When I seem stuck or ask "where do I start?", prescribe the smallest possible concrete first step — specific file, exact command.
- **nd-time-blindness**: When giving estimates, always give best/realistic/worst range with named hidden costs.
CODEX_BLOCK
    echo "  ✓ AGENTS.md updated"
  fi
else
  echo "  ⚠ Codex directory not found at $CODEX_DIR (is Codex installed?)"
fi

echo ""
echo "Done. Reload Claude Code / Codex to pick up the new skills."
echo ""
echo "To auto-activate in Claude Code, add this to ~/.claude/CLAUDE.md:"
echo "  ## ND Skills"
echo "  Apply nd-research-gate, nd-complexity-gate, nd-choicereduce, nd-selfmonitor,"
echo "  nd-setshift, nd-taskboundary, nd-working-memory, nd-task-initiation,"
echo "  nd-time-blindness patterns throughout all sessions."
