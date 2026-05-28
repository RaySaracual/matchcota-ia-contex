# Sprint Generator

## Purpose

Generate structured sprint planning based on project specifications, architecture, dependencies, and priorities.

---

# Responsibilities

- Generate implementation phases.
- Generate sprint roadmap.
- Detect dependencies.
- Detect blockers.
- Detect implementation order.
- Prioritize delivery.

---

# Input Sources

Read in this order:

```txt
ai/specs/init-spec.md
ai/specs/*
ai/architecture/*
ai/context/*
```

> Detect implementation order from module dependencies in the spec.
> Use architecture to identify technical prerequisites between tasks.

---

# Output

Generate:

```txt
ai/sprints/*
```

Examples:

```txt
roadmap.md
sprint-01.md
sprint-02.md
backlog.md
```

---

# Sprint Rules

* Sprints must be incremental.
* Avoid oversized sprints.
* Prioritize architecture first.
* Prioritize high-risk areas first.
* Define measurable goals.
* Define completion criteria.

---

# Sprint Structure

1. Sprint Goal
2. Features
3. Tasks
4. Dependencies
5. Risks
6. QA Scope
7. Acceptance Criteria
8. Evidence Required
