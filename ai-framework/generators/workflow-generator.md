# Workflow Generator

## Purpose

Generate operational workflows for development, QA, release management, incident handling, and domain-specific execution.

---

# Responsibilities

- Detect lifecycle requirements.
- Detect approval flows.
- Detect QA flows.
- Detect deployment flows.
- Detect release processes.
- Generate operational procedures.

---

# Input Sources

Read:

```txt
ai/specs/*
ai/architecture/*
ai/context/*
```

> Detect workflows from business flows, approval processes, and lifecycle requirements defined in specs.

---

# Output

Generate:

```txt
ai/workflows/*
```

---

# Workflow Structure

1. Purpose
2. Trigger
3. Preconditions
4. Execution Flow
5. Validation Rules
6. Required Evidence
7. Completion Criteria
8. Failure Handling
9. Escalation Rules
