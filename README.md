# Neurodivergent Agent Skills

A collection of AI agent skills grounded in executive function (EF) research, designed for neurodivergent developers working with Claude Code, Codex, and similar AI coding assistants.

These skills make the agent smarter about *how* to work with a neurodivergent brain — not just what to build.

---

## Why these exist

Executive function (EF) is the set of cognitive processes that manage attention, working memory, impulse control, planning, and cognitive flexibility. ADHD, autism, dyslexia, and other neurodivergent profiles often involve EF differences that affect how work gets started, sustained, and finished.

Most AI coding tools optimize for producing technically correct output. They don't account for:
- Research spirals that feel productive but don't ship anything
- Choice paralysis when the backlog has 20 equally valid options
- Working memory constraints that make long sessions progressively harder
- Task initiation barriers that aren't about capability — just activation
- Time blindness that turns "this should be quick" into an 8-hour session
- Hyperfocus that produces excellent work on the wrong thing

These skills are behavioral instructions that change how the agent works alongside you — not what it produces, but *how* it communicates, checks in, and manages attention.

---

## Skills included

| Skill | What it does | EF component |
|-------|-------------|--------------|
| `nd-research-gate` | Interrupt research spirals after N turns without output | Inhibitory control |
| `nd-complexity-gate` | Suggest planning before executing complex requests | Planning / organization |
| `nd-choicereduce` | Show only top 3 options when backlog > 3 items | Working memory / decision |
| `nd-taskboundary` | Mark cognitive transitions when topics shift | Cognitive flexibility |
| `nd-velocity-check` | Track capture:ship ratio — surface the ideas-rich/finish-poor pattern | Metacognition |
| `nd-working-memory` | Hold task state explicitly; re-surface goals when context grows | Working memory |
| `nd-inhibit` | Before acting, check whether this serves the current goal | Inhibitory control |
| `nd-setshift` | Detect stuck loops; read prior failure logs; propose strategy pivots | Cognitive flexibility |
| `nd-selfmonitor` | Pre-flight check before destructive or irreversible operations | Self-monitoring |
| `nd-closuregate` | Surface nearly-done tasks before starting something new | Task completion |
| `nd-task-initiation` | Break the blank page with a specific, tiny first step | Task initiation |
| `nd-hyperfocus-guard` | Name rabbit holes; offer structured exit or acknowledgment | Attention regulation |
| `nd-time-blindness` | Give honest, ND-calibrated effort estimates with hidden costs | Time perception |
| `nd-sensory-load` | Adjust output density to match cognitive load | Cognitive load management |

---

## How it works

Each skill is a behavioral instruction set that tells an AI agent:
- **When to activate** (specific trigger conditions)
- **What to do** (concrete, step-by-step instructions)
- **What NOT to do** (common failure modes)
- **Why it works** (the science basis, briefly)

Skills are non-blocking by default. They surface patterns and offer options — they never gate or block the user. The human is always in control.

---

## Installation

### Quick install (recommended)

```bash
git clone https://github.com/jpoindexter/neurodivergent-agent-skills.git
cd neurodivergent-agent-skills
bash install.sh
```

The install script copies all 14 skills to `~/.claude/skills/` (Claude Code) and appends behavioral instructions to `~/.codex/AGENTS.md` (Codex).

---

### Making skills always-on in Claude Code

> **Important:** Installing the skill files alone is not enough. By default, Claude Code invokes skills on demand — it has to judge when one applies. To make every skill fire automatically without being asked, you need to add them to your `~/.claude/CLAUDE.md`.

Add this section to `~/.claude/CLAUDE.md`:

```markdown
## ND Skills — always on

Apply these behavioral patterns in every session. Do not wait to be asked.

- **nd-research-gate** — After 8 consecutive turns of reading/analysis/research without a file write, shell command, or commit: surface the count, restate the original goal, ask one question: "Want to pick one finding to build now?"
- **nd-complexity-gate** — Before any multi-file, schema-change, migration, or ambiguous-spec request: emit one line suggesting `/planmode` if plan mode is not already active. Never block.
- **nd-choicereduce** — When presenting options or a backlog: show only the top 3 ranked by effort (smallest first). Note the hidden count. Never show the full list unprompted.
- **nd-taskboundary** — When the incoming message shares less than 15% keyword overlap with the active goal and is 4+ words: emit one line naming the topic shift. Offer `/boundary` to mark it.
- **nd-working-memory** — Re-state the active task context (goal + current step + remaining steps) every 5 turns in sessions longer than 10 turns. After context compression: always re-anchor before continuing.
- **nd-inhibit** — Before each tool call: verify it serves the current goal. After 3 adjacent off-goal calls: name the drift in one line.
- **nd-setshift** — When the same error or approach appears 3+ times without progress: name the stuck loop and propose a genuinely different strategy. Check ERRORS.md at task start for similar prior failures.
- **nd-selfmonitor** — Before overwriting files, destructive shell commands, or commits: emit one sentence confirming the action matches the current goal.
- **nd-task-initiation** — When a user stalls, says "I don't know where to start", or goes quiet after a new task: prescribe the single smallest concrete first action (specific file, exact command — not guidance).
- **nd-hyperfocus-guard** — After 10+ consecutive turns deep in one area without referencing the original goal: name the pattern once and offer a structured exit.
- **nd-time-blindness** — For any effort estimate: give best/realistic/worst range with named hidden costs. Never give a single-point estimate for work with unknowns.
- **nd-closuregate** — Before engaging a substantially new task thread: check for unfinished items from the current session. If any are >50% done, surface one question before switching.
- **nd-velocity-check** — When a session starts with a long backlog or the user asks "what should I work on?": note the capture:ship ratio if it's above 5:1.
- **nd-sensory-load** — Default to compressed output: one idea per paragraph, actions in bullets, bold the one most important thing. Expand only when explicitly learning something new.
```

This tells Claude to apply all 14 patterns as standing behavior — not wait to be asked.

---

### Codex CLI

The install script handles this automatically. It appends behavioral instructions to `~/.codex/AGENTS.md`. To do it manually:

```bash
cat >> ~/.codex/AGENTS.md << 'EOF'

## ND Skills — always on

Apply these behavioral patterns in every session. Do not wait to be asked.

- After 8 research turns without concrete output, surface the nd-research-gate check-in
- Before complex multi-file requests, suggest planning (nd-complexity-gate)
- When presenting more than 3 options, show only top 3 ranked by effort (nd-choicereduce)
- Before destructive operations, emit a one-sentence intent check (nd-selfmonitor)
- After 3 similar failed attempts, propose a genuinely different approach (nd-setshift)
- When topics shift mid-session, name the transition and offer /boundary (nd-taskboundary)
- Re-state task context every 5 turns in long sessions (nd-working-memory)
- When stuck or blank on where to start, prescribe the smallest concrete first step (nd-task-initiation)
- For all estimates: give best/realistic/worst range with named hidden costs (nd-time-blindness)
- Default to compressed output: bullets over prose, bold the one key thing (nd-sensory-load)
EOF
```

---

### Install individual skills only

```bash
cp -r skills/nd-research-gate ~/.claude/skills/
```

---

## Philosophy

These skills are based on the following principles:

**1. Neurodivergence is a cognitive style, not a deficit.**
The patterns these skills address (hyperfocus, research spirals, task initiation difficulty) are cognitive traits with documented advantages in the right context. The skills don't fix anything — they provide scaffolding that makes the advantages available while reducing the friction.

**2. External structure substitutes for internal executive function.**
When internal EF is unreliable, external structure (visible checklists, explicit prompts, named patterns) performs the same function. This is the same principle behind timers, habit trackers, and external accountability partners — generalized to an AI agent.

**3. Awareness before action.**
None of these skills block. They surface patterns so the human can choose. The goal is always metacognitive: giving the user visibility into what's happening so they can decide what to do about it.

**4. Small, specific, immediate.**
Every intervention prescribes the *smallest concrete next thing*, not a plan or a strategy. "Write the first test name" is more useful than "start with TDD." Specificity removes activation cost.

---

## Science basis

These skills draw primarily from:

- **Rabinovici et al. (2015), "Executive Dysfunction"** (UCSF Memory and Aging Center, PMC4455841) — the clinical EF framework: 4 components, 9 symptom patterns, treatment approaches
- **Barkley (1997, 2012)** — ADHD as an inhibitory control deficit affecting self-regulation over time
- **Brown (2005)** — the "activation" model of ADHD: difficulty initiating, sustaining, and managing the energy for tasks
- **Cognitive load theory** (Sweller, 1988) — intrinsic vs extraneous vs germane load
- **Planning fallacy** (Kahneman & Tversky, 1979) — systematic underestimation of task duration
- **Set-shifting research** in ADHD and autism — the neuroscience of cognitive flexibility and perseveration

---

## Contributing

Skills should:
- Address a specific, named EF component (not "productivity in general")
- Specify concrete trigger conditions
- Give step-by-step instructions, not guidelines
- Include a brief science basis
- Be non-blocking — the human is always in control

See any existing skill for format reference.

---

## License

MIT. Use freely, adapt, share.
