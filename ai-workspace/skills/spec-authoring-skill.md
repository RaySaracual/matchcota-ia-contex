# Spec Authoring Skill

## Goal

Transform requirements into a complete, testable, and traceable spec.

---

## Authoring Checklist

1. Convert vague statements into explicit requirements.
2. Tag each requirement with an ID (`FR-001`, `NFR-001`, etc.).
3. Add acceptance criteria per requirement.
4. Separate facts from assumptions.
5. Mark inferred content with `[inferred]`.
6. Record missing information in `Open Questions`.
7. Ensure each workflow includes states and transitions.
8. Ensure every business rule can be traced to a source.

---

## Suggested Requirement Format

- ID: FR-XXX
- Description: <what must happen>
- Rationale: <why this exists>
- Preconditions: <state before>
- Postconditions: <state after>
- Acceptance Criteria: <measurable checks>

---

## Quality Bar

- No ambiguous words without measurable definition (`fast`, `easy`, `secure`).
- No requirement without acceptance criteria.
- No hidden dependency.
- No unresolved contradiction.
