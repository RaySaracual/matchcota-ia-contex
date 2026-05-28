# Context Generator

## Purpose

Generate the project context files in `ai/context/` from business documents, technical notes, team interviews, or existing system descriptions. Enables persistent contextual intelligence across all AI sessions.

---

# Responsibilities

- Extract project domain and business objectives.
- Identify the technology stack.
- Identify key actors and system boundaries.
- Build the domain glossary.
- Define what is out of scope.
- Document conventions and folder structure.
- Produce files that are concise enough to load every session without token waste.

---

# Input Sources

Primary source (mandatory):

```txt
ai/specs/init-spec.md
```

Secondary sources (if spec is incomplete):

- Business documents or briefs
- Existing README files
- Architecture notes
- Team descriptions
- Meeting summaries
- Existing codebase analysis

> Always read the spec first. Use secondary sources only to fill gaps the spec does not cover.

---

# Output

Generate:

```txt
ai/context/project.md
ai/context/stack.md
```

Optional additional files:

```txt
ai/context/conventions.md   → project-specific naming and coding conventions
ai/context/integrations.md  → external systems, APIs, and dependencies
ai/context/glossary.md      → domain terms if the glossary grows large
```

---

# Rules

* Context files must be concise — they are loaded every session.
* Never exceed what is strictly necessary for the agent to understand the project.
* Prefer bullet points and tables over long prose.
* Keep `project.md` and `stack.md` as the mandatory minimum.
* Do not duplicate information between context files.
* Update context files when the stack or domain changes significantly.
* Context files are living documents — not one-time artifacts.

---

# Context File Size Guidelines

| File | Max recommended size |
|---|---|
| `project.md` | ~50–80 lines |
| `stack.md` | ~40–60 lines |
| `conventions.md` | ~30–50 lines |
| Any context file | < 100 lines |

---

# Validation Checklist

Before finalizing:

* Is the project domain clearly described in one paragraph?
* Are the top business objectives listed?
* Is the stack fully described (frontend, backend, infra)?
* Is the glossary populated with domain terms?
* Is out-of-scope explicitly stated?
* Are all context files free of redundant information?
