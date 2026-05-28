# Session Initialization Orchestrator

## Purpose

Define the mandatory startup protocol for every AI session. Ensures the agent loads the minimum necessary context before taking any action, avoiding cold-start errors and context drift between sessions.

---

# When to Use

At the beginning of every work session, before any implementation, analysis, or generation task.

---

# Flow

## Step 1 — Load Mandatory Context

Read in this exact order:

```txt
ai/context/project.md
ai/context/stack.md
```

> If either file is missing or empty, stop and notify the user. Do not proceed.

---

## Step 2 — Load Project State

Read:

```txt
ai/state/project-status.md
```

Identify:

* current sprint
* completed features
* active blockers
* known issues

---

## Step 3 — Load Active Task

Read:

```txt
ai/execution/current-task.md
```

Identify:

* active task name and objective
* task scope (in / out)
* related spec path
* active risks
* progress so far
* next steps

> If `current-task.md` is empty, ask the user what they want to work on before continuing.

---

## Step 4 — Load Relevant Specs

Based on the active task, load only the specs that are relevant:

```txt
ai/specs/<relevant-module>.md
```

> Do not load all specs. Load only what the current task requires.

---

## Step 5 — Load Architecture (if needed)

If the task involves structural changes, new modules, or integration work:

```txt
ai/architecture/<relevant-file>.md
```

---

## Step 6 — Confirm Readiness

Before proceeding, confirm internally:

* [ ] Project domain understood.
* [ ] Stack identified.
* [ ] Current state known.
* [ ] Active task defined.
* [ ] Relevant spec loaded.
* [ ] No missing context files.

If any item fails, request the missing information from the user before continuing.

---

# Context Loading Strategy

| Context Type | Load Strategy |
|---|---|
| `project.md`, `stack.md` | Always — every session |
| `project-status.md`, `current-task.md` | Always — every session |
| Specs | On demand — only relevant to active task |
| Architecture | On demand — only when structurally needed |
| Evidence | On demand — only during QA or release cycles |
| Decisions (ADRs) | On demand — only when making architectural decisions |

---

# Operational Rules

* Never skip Step 1 and Step 2.
* Never load all specs at once — use context slicing.
* If context files are outdated, flag it and continue with the best available information.
* Update `current-task.md` with current session scope before starting work.
