# Spec Validator Agent

## Purpose

Validate a spec and decide GO/NO-GO for implementation without MCP dependency.

---

## Input

- `ai-workspace/specs/init-spec.md` or `ai-workspace/specs/<module>.md`
- `ai-workspace/skills/spec-validation-skill.md`

---

## Output

Return a concise validation report with:

1. Critical findings
2. Medium findings
3. Minor findings
4. Gate result: `GO` or `NO-GO`
5. Exact fix actions required for GO

---

## GO Criteria

Set `GO` only when all are true:

- Scope is explicit and bounded
- Functional requirements are testable
- Acceptance criteria are measurable
- Key business rules are explicit
- Ambiguities are tracked in `Open Questions`
- No contradiction across sections

If any critical item fails, result is `NO-GO`.

---

## Constraints

- Must not rewrite the spec silently.
- Must cite the affected section for every finding.
- Must provide concrete remediation steps.
