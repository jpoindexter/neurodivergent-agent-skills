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

### Claude Code

Copy the skills to your Claude Code skills directory:

```bash
# From this repo
cp -r skills/* ~/.claude/skills/
```

Or install individual skills:
```bash
cp -r skills/nd-research-gate ~/.claude/skills/
```

Once installed, Claude Code can invoke them via the `Skill` tool:
```
Use the nd-research-gate skill to check in on this session.
```

### Codex CLI

Add the skills as instructions in your Codex agent file:

```bash
# Add skill summaries to ~/.codex/AGENTS.md
cat >> ~/.codex/AGENTS.md << 'EOF'

## ND Skills — active behavioral patterns

When working with me, apply these patterns from the neurodivergent-agent-skills pack:

- After 8 research turns without concrete output, surface the nd-research-gate check-in
- Before complex multi-file requests, suggest planning (nd-complexity-gate)
- When presenting options > 3, show only top 3 ranked by effort (nd-choicereduce)
- Before destructive operations, emit a one-sentence intent check (nd-selfmonitor)
- When I seem stuck after 3 similar attempts, propose a different approach (nd-setshift)
- When tasks shift topics mid-session, name the transition (nd-taskboundary)
EOF
```

### Auto-activate in Claude Code

To have these skills trigger automatically, reference them in your `~/.claude/CLAUDE.md`:

```markdown
## ND Skills — active behavioral patterns

When working with me, apply these patterns throughout every session:
- `nd-research-gate`: After 8 consecutive research/analysis turns, check in
- `nd-complexity-gate`: Suggest planning for multi-file or ambiguous requests
- `nd-choicereduce`: Show only top 3 when presenting options
- `nd-selfmonitor`: One-sentence intent check before destructive operations
- `nd-setshift`: After 3 similar failed attempts, pivot the approach
- `nd-taskboundary`: Name topic shifts explicitly
- `nd-working-memory`: Re-state task context after every 5 turns in long sessions
- `nd-task-initiation`: When I stall, prescribe the smallest concrete first step
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
