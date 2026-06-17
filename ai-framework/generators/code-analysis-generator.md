# Code Analysis Generator

## Purpose

Scan an existing codebase (legacy, in-progress, or production) and extract structured information
to feed the `spec-generator.md` in reverse-engineering mode.
This generator bridges existing code into the Spec-Driven workflow.

---

# When to Use

- Adopting this framework on a project that already has code.
- Integrating Spec-Driven into a legacy or production application.
- Generating an `init-spec.md` when no requirements document exists.

---

# Multi-Repo Projects (Backend + Frontend + Infra)

Un ia-context cubre el sistema completo, no un repo individual.
Si el proyecto tiene múltiples repos, escanéalos todos antes de producir el output.

## Cómo declarar los repos a escanear

Al invocar este generator, el agente debe recibir la lista de repos:

```
Repos a escanear:
- backend:  <ruta local o URL>
- frontend: <ruta local o URL>
- infra:    <ruta local o URL>  (opcional)
```

## Orden de escaneo multi-repo

1. **Infra primero** (si existe) → revela servicios, bases de datos, entornos, secrets
2. **Backend** → entidades, API, reglas de negocio, integraciones
3. **Frontend** → módulos de UI, flujos de usuario, llamadas a API consumidas

## Reglas multi-repo

- Cada repo se escanea con el mismo orden de capas (Layer 1 → Layer 8).
- El output es **un solo `codebase-analysis.md`** que integra todos los repos.
- Cuando backend y frontend declaran lo mismo (ej. un endpoint), validar que coincidan. Si no coinciden, marcarlo como ambigüedad.
- Las entidades del backend son la fuente de verdad del modelo de datos.
- Los tipos/interfaces del frontend complementan pero no contradicen el backend.
- Identificar explícitamente qué repo es responsable de cada módulo en la tabla de Módulos del output.

---

# Scan Order

Read files in this exact order. Stop at each layer and extract before moving to the next.

## Layer 1 — Project Identity

Read:
- `README.md`, `README.rst`, `README.txt`
- `package.json`, `pyproject.toml`, `pom.xml`, `build.gradle`, `*.csproj`, `Cargo.toml`
- `docker-compose.yml`, `docker-compose.yaml`
- `.env.example`, `.env.sample`

Extract:
- Project name and description
- Declared tech stack (language, framework, runtime version)
- Declared dependencies and their versions
- Environment variables and their purpose

## Layer 2 — Entry Points and App Structure

Read:
- `src/main.*`, `src/index.*`, `src/app.*`, `src/server.*`
- `Program.cs`, `Application.java`, `wsgi.py`, `asgi.py`, `manage.py`
- Top-level folder names

Extract:
- Application type (API, monolith, SPA, worker, CLI, etc.)
- Top-level modules and their apparent purpose
- How the app starts (port, protocol, boot sequence)

## Layer 3 — Data Model

Read:
- `models/`, `entities/`, `domain/`, `schemas/`, `types/`
- ORM model files (`*.model.ts`, `*.entity.ts`, `models.py`, `*.cs` with DbSet)
- Migration files (`migrations/`, `db/migrate/`)
- GraphQL schemas (`*.graphql`, `schema.graphql`)
- OpenAPI / Swagger files (`openapi.yaml`, `swagger.json`)

Extract:
- Entities and their attributes
- Relationships (one-to-many, many-to-many, etc.)
- Enum values and their business meaning
- Fields with constraints (unique, required, indexed)

## Layer 4 — API Surface

Read:
- `routes/`, `controllers/`, `handlers/`, `resolvers/`
- `*.controller.ts`, `*Router.ts`, `*_views.py`, `*Controller.java`
- OpenAPI spec if present

Extract:
- Endpoints (method + path + purpose)
- Request/response shapes
- Authentication/authorization patterns (`@Auth`, middleware, guards)
- Pagination, filtering, sorting patterns

## Layer 5 — Business Logic

Read:
- `services/`, `use-cases/`, `application/`, `domain/services/`
- `*.service.ts`, `*Service.java`, `*_service.py`
- Validation files (`validators/`, `*.validator.ts`, `schemas/` with Zod/Joi/Yup)

Extract:
- Business operations (what the app does, not how)
- Validation rules
- Business rules embedded in conditional logic
- State machines or status transitions

## Layer 6 — Integrations

Read:
- `integrations/`, `adapters/`, `infrastructure/`, `clients/`
- HTTP client calls (`axios`, `fetch`, `HttpClient`, `requests`)
- Queue/event producers and consumers (`kafka`, `rabbitmq`, `sqs`, `pubsub`)
- Cron jobs and scheduled tasks

Extract:
- External services called (name, purpose, direction: inbound/outbound)
- Event types published or consumed
- Scheduled jobs and their frequency

## Layer 7 — Tests (if present)

Read:
- `tests/`, `__tests__/`, `spec/`, `test/`
- `*.test.ts`, `*.spec.ts`, `*_test.py`, `*Test.java`

Extract:
- Test descriptions as acceptance criteria
- Edge cases and negative cases being tested
- Mocked dependencies (reveals integrations)

## Layer 8 — Infrastructure and Deployment

Read:
- `Dockerfile`, `docker-compose.yml`
- `k8s/`, `helm/`, `infra/`, `terraform/`, `bicep/`, `cdk/`
- CI/CD: `.github/workflows/`, `.gitlab-ci.yml`, `azure-pipelines.yml`
- Cloud config: `app.yaml`, `serverless.yml`

Extract:
- Deployment targets (cloud provider, container platform)
- Services provisioned (databases, caches, queues, storage)
- Environment names (dev, staging, prod)
- Secrets management approach

---

# Output

Generate:

```txt
ai/context/codebase-analysis.md
```

## Output Structure

```markdown
# Codebase Analysis

## Scan Metadata
- Date: <date>
- Scanned by: <agent>
- Confidence: HIGH | MEDIUM | LOW  (overall)

## Project Identity
...

## Application Type
...

## Tech Stack
...

## Modules
| Module | Repo | Path | Purpose | Confidence |
|--------|------|------|---------|------------|
| ... | backend/frontend/infra | ... | ... | HIGH/MEDIUM/LOW |

## Entities
| Entity | Attributes | Relationships | Confidence |
|--------|------------|---------------|------------|
| ... | ... | ... | HIGH/MEDIUM/LOW |

## API Endpoints
| Method | Path | Purpose | Auth Required | Confidence |
|--------|------|---------|---------------|------------|
| ... | ... | ... | ... | HIGH/MEDIUM/LOW |

## Business Rules (Inferred)
- Rule: <description> | Source: <file:line> | Confidence: HIGH/MEDIUM/LOW

## Integrations
| Service | Direction | Purpose | Confidence |
|---------|-----------|---------|------------|
| ... | ... | ... | HIGH/MEDIUM/LOW |

## Non-Functional Requirements (Observed)
...

## Deployment
...

## Gaps and Ambiguities
- <cosa que no pudo inferirse> → Requires human input

## Open Questions for Human Validation
1. ...
2. ...
```

---

# Rules

- **Never invent business intent.** If unsure, mark as LOW confidence and add to Open Questions.
- **Infer from code structure, not assumptions.** Business rules must trace to a file and line.
- **Mark every inference with a confidence level** (HIGH / MEDIUM / LOW).
- **Do not treat existing code as correct behavior.** Flag inconsistencies and ask.
- **Extract acceptance criteria from test descriptions verbatim** when available.
- **Stop and report gaps** rather than fabricating missing information.
- Prefer breadth over depth: cover all modules at surface level before diving into any one.
