# QA Orchestrator

## Purpose

Coordinate manual and automated quality assurance validation against spec acceptance criteria.

---

# Responsibilities

- Validate acceptance criteria defined in the spec.
- Execute and document validations.
- Generate evidence for every validated criterion.
- Detect regressions.
- Validate architecture compliance.
- Update QA status in project state.

---

# Flow

## Step 1 — Load Spec Acceptance Criteria

Read the relevant spec:

```txt
ai/specs/<module>.md
```

Extract the acceptance criteria section. This is the validation target.

---

## Step 2 — Execute Validations

For each acceptance criterion:

* Execute the corresponding test or manual validation.
* Record result: PASS / FAIL / PARTIAL.
* Capture evidence (screenshot, log, report).

---

## Step 3 — Regression Check

* Run tests on previously completed features.
* Verify no regressions introduced by the current change.

---

## Step 4 — Architecture Compliance Check

* Verify implementation follows `ai/architecture/*`.
* Verify standards from `ai-engineering-framework/standards/*` are respected.

---

## Step 5 — Register Evidence

Store:

```txt
ai/evidence/reports/<feature>-qa-report.md
ai/evidence/screenshots/<feature>/
ai/evidence/coverage/<feature>/
```

---

## Step 6 — Update State

Update:

```txt
ai/state/project-status.md
```

Mark the module QA status: PASS / FAIL / PARTIAL.

---

# Completion Criteria

* All acceptance criteria from the spec have been evaluated.
* Evidence exists for every criterion.
* No open regressions.
* QA status updated in `project-status.md`.
