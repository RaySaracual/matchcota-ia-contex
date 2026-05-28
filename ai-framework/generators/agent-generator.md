# Agent Generator

## Purpose

Generate contextual AI agents specialized for the current project domain, workflows, architecture, and technical stack.

---

# Responsibilities

- **Auto-detect domains from spec** — read `ai/specs/*` and identify areas of high complexity, critical workflows, or integration-heavy modules that require a dedicated agent.
- Detect operational areas.
- Generate specialized agents only for detected domains.
- Avoid redundant agents.
- Define clear agent responsibilities.
- Define agent boundaries.
- Define required context.
- Define collaboration rules.
- Reference skills from `ai/skills/` that the agent will use.

---

# Input Sources

Read:

```txt
ai/specs/*
ai/context/*
ai/architecture/*
```

---

# Output

Generate:

```txt
ai/agents/*
```

Examples:

```txt
payment-agent.md
reporting-agent.md
workflow-engine-agent.md
qa-validation-agent.md
```

---

# Rules

* Agents must have single responsibility.
* Avoid generic agents.
* Prefer specialized agents.
* Agents must not overlap responsibilities.
* Agents must declare required context.
* Agents must define expected outputs.
* Agents must define operational limits.
* **Only generate agents for domains explicitly present in the spec** — do not invent agents.
* After generating agents, run `skill-generator.md` to detect reusable skills they need.

---

# Agent Structure

1. Purpose
2. Responsibilities
3. Input Context
4. Output Expectations
5. Operational Rules
6. Constraints
7. Validation Checklist
8. Dependencies
9. Related Skills
10. Failure Handling
