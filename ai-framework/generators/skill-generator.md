# Skill Generator

## Purpose

Generate reusable contextual operational skills optimized for repetitive, critical, or domain-specific implementation tasks.

---

# Responsibilities

- **Auto-detect reusable patterns from spec and agents** — read `ai/specs/*` and `ai/agents/*` to find repeated logic, validation patterns, or domain-specific workflows that appear in more than one place.
- Detect implementation patterns.
- Detect reusable workflows.
- Detect domain-specific logic.
- Generate reusable operational instructions.
- Reference generated skills from the agents that use them.

---

# Input Sources

Read:

```txt
ai/specs/*
ai/architecture/*
ai/context/*
```

---

# Output

Generate:

```txt
ai/skills/*
```

Examples:

```txt
create-debtor-workflow.md
validate-sla-rules.md
generate-report-export.md
```

---

# Rules

* Skills must be reusable.
* Skills must be focused.
* Skills must be deterministic.
* Skills must follow project standards.
* Skills must define expected outputs.
* Skills must include validation steps.

---

# Skill Structure

1. Purpose
2. Context Requirements
3. Preconditions
4. Execution Steps
5. Expected Output
6. Validation Rules
7. Failure Conditions
8. Related Standards
9. Related Architecture
