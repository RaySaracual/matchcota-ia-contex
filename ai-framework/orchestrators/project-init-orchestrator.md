# Project Initialization Orchestrator

## Purpose

Orchestrate the complete spec-first setup of a new project. Transforms a single initial spec into all the base artifacts needed to start AI-assisted development: context, architecture, sprints, standards, agents, and skills.

---

# When to Use

Once, at the start of a new project — after writing `ai/specs/init-spec.md`.

---

# Precondition

`ai/specs/init-spec.md` must exist and be complete before running this orchestrator.

If it doesn't exist, run `ai-engineering-framework/generators/spec-generator.md` first.

---

# Flow

## Phase 1 — Read the Initial Spec

Read:

```txt
ai/specs/init-spec.md
```

Extract and internalize:

* Project domain and business objectives
* Technology stack (frontend, backend, infra)
* Key actors and roles
* Main modules and submodules
* Core workflows
* Business rules
* Non-functional requirements
* Integration needs
* Security requirements

> Everything generated in subsequent phases derives from this read. Do not proceed if the spec is incomplete.

---

## Phase 2 — Generate Context

Using: `ai-engineering-framework/generators/context-generator.md`

Generate:

```txt
ai/context/project.md
ai/context/stack.md
```

Rules:
* Extract only — do not invent or add information not in the spec.
* Keep each file under 100 lines.

---

## Phase 3 — Generate Architecture

Using: `ai-engineering-framework/generators/architecture-generator.md`

Generate:

```txt
ai/architecture/system-overview.md
```

Additional files based on spec complexity:

```txt
ai/architecture/frontend-architecture.md   (if frontend exists)
ai/architecture/backend-architecture.md    (if backend exists)
ai/architecture/security-architecture.md   (if auth/security requirements exist)
ai/architecture/integration-architecture.md (if external integrations exist)
```

---

## Phase 4 — Generate Sprints

Using: `ai-engineering-framework/generators/sprint-generator.md`

Generate:

```txt
ai/sprints/roadmap.md
ai/sprints/sprint-01.md
ai/sprints/backlog.md
```

Rules:
* Detect implementation order from dependencies in the spec.
* Architecture-first — sprint 1 must cover foundational structure.
* High-risk modules go before complex features.

---

## Phase 5 — Adjust Standards

Using: `ai-engineering-framework/generators/standards-generator.md`

Update or override:

```txt
ai-engineering-framework/standards/
```

Rules:
* Read the detected stack from the spec.
* Override generic base standards with project-specific rules.
* Do not preserve base rules that contradict the project stack or architecture.
* Generate only the standard files relevant to the detected stack.

---

## Phase 6 — Detect and Generate Agents

Using: `ai-engineering-framework/generators/agent-generator.md`

Analyze the spec to detect domains that require specialized agents:

* High-complexity business domains → dedicated agent
* Critical workflows → dedicated agent
* External integrations → dedicated agent
* QA-heavy modules → dedicated agent

Generate:

```txt
ai/agents/<domain>-agent.md
ai/agents/caveman-agent.md
```

> Do not generate generic domain agents. Only generate agents for domains explicitly present in the spec.
> Exception: always create `ai/agents/caveman-agent.md` as transversal token-saver support.

---

## Phase 7 — Detect and Generate Skills

Using: `ai-engineering-framework/generators/skill-generator.md`

Analyze the spec and the generated agents to detect reusable patterns:

* Repeated workflows across modules → skill
* Domain-specific validation logic → skill
* Integration patterns used in multiple places → skill

Generate:

```txt
ai/skills/<pattern>.md
```

> Reference generated skills from the agents that use them.

---

## Phase 8 — Generate AGENTS.md

Using: `ai-engineering-framework/generators/agents-md-generator.md`

Generate or update:

```txt
AGENTS.md
```

Include:
* Project-specific policies derived from the spec.
* References to generated agents and skills.
* Updated orchestrator and generator references.

---

## Phase 9 — Initialize State Files

Create or update:

```txt
ai/execution/current-task.md   → set first task: "Start Sprint 1"
ai/state/project-status.md     → set status: ACTIVE, current sprint: sprint-01
```

---

## Completion Criteria

The project initialization is complete when:

* [ ] `ai/specs/init-spec.md` — complete and reviewed
* [ ] `ai/context/project.md` + `stack.md` — generated from spec
* [ ] `ai/architecture/system-overview.md` — generated
* [ ] `ai/sprints/roadmap.md` + `sprint-01.md` + `backlog.md` — generated
* [ ] Standards updated to reflect actual project stack
* [ ] Agents generated for detected domains (0 or more)
* [ ] Skills generated for detected reusable patterns (0 or more)
* [ ] `AGENTS.md` — complete and operational
* [ ] `ai/execution/current-task.md` + `ai/state/project-status.md` — initialized
