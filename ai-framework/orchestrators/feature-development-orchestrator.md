# Feature Development Orchestrator

## Purpose

Coordinate the complete lifecycle of feature development using AI-driven workflows.

---

# Flow

## Phase 1 — Context Loading

Read in this order:

```txt
ai/context/project.md
ai/context/stack.md
ai/state/project-status.md
ai/execution/current-task.md
```

Then load **only the specs relevant to this feature** (not all specs):

```txt
ai/specs/<relevant-module>.md
```

Load architecture only if the feature involves structural changes:

```txt
ai/architecture/<relevant-file>.md
```

> Never load all specs at once. Use context slicing — load only what this feature requires.

---

## Phase 2 — Execution Initialization

Update:

```txt
ai/execution/current-task.md
```

Document:

* feature name
* current objective
* implementation scope
* active risks

---

## Phase 3 — Standards and Agent Check

Before coding, verify:

* Are there project-specific standards in `ai-engineering-framework/standards/` for this feature's stack? If not, run `standards-generator.md`.
* Are there agents in `ai/agents/` relevant to this feature's domain? If not, evaluate whether one is needed.
* Are there skills in `ai/skills/` that apply to this feature? Reference them in the implementation.

---

## Phase 4 — Development

Execute:

* frontend tasks
* backend tasks
* integration tasks
* validation tasks

Follow:

```txt
ai-engineering-framework/standards/*
```

Use relevant agents and skills from:

```txt
ai/agents/*
ai/skills/*
```

---

## Phase 5 — Validation

Validate against the spec's acceptance criteria:

* business rules defined in the spec
* architecture compliance
* coding standards (project-specific, not generic base)
* tests covering all acceptance criteria
* security rules

---

## Phase 5 — Evidence Registration

Store:

```txt
ai/evidence/*
```

Examples:

* screenshots
* reports
* test results
* coverage reports

---

## Phase 6 — State Update

Update:

```txt
ai/state/completed-features.md
```

---

## Phase 7 — Decision Registration

If architectural decisions were made:

Create:

```txt
ai/decisions/ADR-XXX.md
```
