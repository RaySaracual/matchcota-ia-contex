# Spec Validation Skill

## Goal

Evaluate whether a spec is implementation-ready and can pass manual gate GO.

---

## Validation Checklist

1. Scope is explicit and has out-of-scope boundaries.
2. Actors and permissions are identified.
3. Functional requirements are atomic and testable.
4. Non-functional requirements have measurable targets.
5. Business rules are explicit and non-contradictory.
6. Workflows define clear start/end states.
7. Acceptance criteria exist for all key requirements.
8. Integrations/dependencies are documented.
9. Risks and assumptions are explicit.
10. Open Questions are listed and prioritized.

---

## Severity Model

- Critical: blocks implementation; must be fixed for GO.
- Medium: high risk of rework; should be fixed before build starts.
- Minor: clarity improvement; can be fixed in next revision.

---

## Output Template

- Critical findings:
- Medium findings:
- Minor findings:
- Gate result: GO | NO-GO
- Actions to reach GO:
