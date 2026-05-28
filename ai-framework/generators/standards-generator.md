# Standards Generator

## Purpose

Generate project-specific engineering standards derived from the actual project specs, stack, and domain context — not generic global rules.

---

# Responsibilities

- Read project specs to detect domain-specific patterns.
- Read stack context to apply technology-aware rules.
- Generate standards adapted to the project's architecture.
- Avoid generating standards that contradict existing architecture decisions.
- Keep standards focused, actionable, and measurable.

---

# Input Sources

Read:

```txt
ai/specs/*
ai/context/stack.md
ai/context/project.md
ai/architecture/*
```

---

# Output

Generate or update:

```txt
ai-engineering-framework/standards/
```

Examples:

```txt
coding-style.md
api-standards.md
frontend-standards.md
backend-standards.md
testing-standards.md
security-standards.md
git-strategy.md
documentation-standards.md
```

---

# Rules

* Standards must reflect the actual project stack — not hypothetical stacks.
* Standards must be derived from specs, not invented independently.
* Each standard must be actionable and verifiable.
* Avoid contradictions between standards.
* Prefer explicit rules over general principles.
* Standards must be updated when the stack or architecture changes.
* Never duplicate rules across standard files.

## Override Rules (critical)

* Base standards are a starting point — not a constraint.
* If a base standard contradicts the project stack or spec, **override it entirely**.
* Do not merge or "extend" base standards that are misaligned — replace them.
* If the project uses a different framework than what a base standard assumes, rewrite that standard for the actual framework.
* After overriding, mark the file with a comment: `> Adjusted from base — derived from ai/specs/init-spec.md`
* Never preserve a base rule just because it exists. Every rule must earn its place in the project context.

---

# Standards Structure

Each standard file should contain:

1. **Principles** — the values guiding this standard.
2. **Rules** — explicit, enforceable rules (use imperative form).
3. **Anti-patterns** — what to explicitly avoid.
4. **Stack-specific guidance** — rules specific to the detected technology.
5. **Examples** (optional) — correct vs incorrect patterns.

---

# Validation Checklist

Before finalizing a standard:

* Does every rule apply to the actual project stack?
* Is every rule testable or reviewable?
* Is there any contradiction with another standard?
* Is there any contradiction with an architectural decision?
* Are anti-patterns explicitly documented?
