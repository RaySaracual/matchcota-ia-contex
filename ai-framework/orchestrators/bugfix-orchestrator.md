# Bugfix Orchestrator

## Purpose

Coordinate structured bug analysis, validation, correction, regression protection, and evidence generation.

---

# Flow

## Step 1 — Load Issue Context

* Read the bug report or issue description.
* Read `ai/state/known-issues.md` if the bug was previously registered.
* Identify the impacted module.

## Step 2 — Load Relevant Spec

Read:

```txt
ai/specs/<impacted-module>.md
```

* Identify the expected behavior from the spec.
* Determine if the bug contradicts the spec or reveals a spec gap.

> If the spec is incomplete or ambiguous, update the spec before fixing the bug.

## Step 3 — Load Architecture

Read:

```txt
ai/architecture/<relevant-file>.md
```

* Understand the architectural boundaries of the impacted module.
* Avoid fixes that violate architectural patterns.

## Step 4 — Reproduce and Validate

* Reproduce the bug locally.
* Confirm it contradicts the spec's expected behavior.

## Step 5 — Apply Fix

* Apply the minimal fix that restores spec-compliant behavior.
* Follow standards from `ai-engineering-framework/standards/`.
* Do not fix unrelated issues in the same change.

## Step 6 — Regression Validation

* Run tests for the fixed module.
* Run tests for adjacent modules that may be affected.
* Verify all previously passing tests still pass.

## Step 7 — Register Evidence

Store:

```txt
ai/evidence/reports/<fix-name>-bugfix-report.md
```

## Step 8 — Update State

Update:

```txt
ai/state/known-issues.md     → mark resolved
ai/state/project-status.md  → update if blocker was cleared
```

## Step 9 — Register Technical Debt (if applicable)

If the fix is a workaround or reveals architectural debt:

```txt
ai/state/known-issues.md     → register debt item
ai/decisions/ADR-NNN.md     → register if architectural decision was made
```
