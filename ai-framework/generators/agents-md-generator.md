# AGENTS.md Generator

## Purpose

Generate the root `AGENTS.md` file for a project. This file is the central instruction entry point that defines mandatory policies, development flow, and skill references for AI agents operating in the repository.

---

# Responsibilities

- Define mandatory development policies.
- Define maintenance policies.
- Define the Spec-Driven flow for the project.
- Map available skills by technology stack.
- Keep the file aligned with the actual project structure.

---

# Input Sources

Read:

```txt
ai/context/*
ai/specs/*
ai-engineering-framework/standards/*
```

---

# Output

Generate or update:

```txt
AGENTS.md
```

Located at the root of the repository.

---

# Rules

* One AGENTS.md per repository — never duplicate.
* Policies must be explicit and enforceable.
* Skills must reference real paths that exist in the repository.
* The Spec-Driven flow must match the actual project workflow.
* Keep it concise — agents load this file on every session.
* No redundant information — reference other files, do not repeat them.

---

# AGENTS.md Structure

1. **Project description** — one sentence about the repository purpose.
2. **Mandatory policies** — non-negotiable rules (e.g., spec gate, no code without approved spec).
3. **Maintenance policies** — source of truth for skills, templates, and rules.
4. **Spec-Driven flow** — numbered steps from requirement to merge.
5. **Skills by stack** — paths to SKILL.md files organized by technology.

---

# Validation Checklist

Before finalizing:

* Does it reference only paths that exist in the repo?
* Are all mandatory policies explicit and unambiguous?
* Is the Spec-Driven flow complete and ordered?
* Are skills organized by stack?
* Is the file free of duplicated content from other files?
