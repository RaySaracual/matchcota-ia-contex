# ai-framework/

Inteligencia reutilizable del framework. El agente la consulta para operar y mantener trazabilidad Spec-Driven.

---

## Qué hay aquí y para qué sirve

### `generators/` — Cómo producir artefactos

| Generator | Produce |
|---|---|
| `spec-generator.md` | `ai-workspace/specs/*.md` |
| `code-analysis-generator.md` | `ai-workspace/context/codebase-analysis.md` |
| `context-generator.md` | `ai-workspace/context/project.md` + `stack.md` |
| `architecture-generator.md` | `ai-workspace/architecture/*.md` |
| `sprint-generator.md` | `ai-workspace/sprints/roadmap.md` + sprints |
| `standards-generator.md` | Standards ajustados al stack real del proyecto |
| `agent-generator.md` | `ai-workspace/agents/*.md` |
| `skill-generator.md` | `ai-workspace/skills/*.md` |
| `workflow-generator.md` | `ai-workspace/workflows/*.md` |
| `agents-md-generator.md` | `AGENTS.md` raíz del repo |

### `orchestrators/` — Cuándo y cómo ejecutar

| Orchestrator | Qué coordina | El equipo dice... |
|---|---|---|
| `session-init-orchestrator.md` | Carga contexto, estado y tarea activa al inicio de sesión | *(automático)* |
| `project-init-orchestrator.md` | Inicialización completa de proyecto (greenfield o legacy) | `Run the project initialization` |
| `feature-development-orchestrator.md` | Implementación trazada al spec | `Implement task X` |
| `bugfix-orchestrator.md` | Diagnóstico + fix + validación | `There is a bug in <módulo>: <descripción>` |
| `qa-orchestrator.md` | QA contra criterios del spec | `Validate this task` |
| `release-orchestrator.md` | Preparación de release con evidencia | `Prepare the release` |

### `standards/` — Reglas de calidad

Estándares base ajustables al stack real del proyecto:

`coding-style` · `api-standards` · `frontend-standards` · `backend-standards` · `testing-standards` · `security-standards` · `git-strategy` · `documentation-standards`

---

## Inicialización según tipo de proyecto

### Greenfield (sin código existente)

1. Crear `ai-workspace/specs/init-spec.md`.
2. Validar quality gate (`spec_validate_quality_gate ok=true`).
3. Ejecutar `Run the project initialization`.

### Existing / Legacy / Production (con código)

1. Ejecutar `code-analysis-generator.md` sobre repos backend/frontend/infra (si aplica).
2. Generar `ai-workspace/context/codebase-analysis.md` consolidado.
3. Ejecutar `spec-generator.md` en modo reverse engineering para producir `ai-workspace/specs/init-spec.md`.
4. Revisar y aprobar reglas `[inferred]` y `Open Questions`.
5. Validar quality gate (`spec_validate_quality_gate ok=true`).
6. Ejecutar `Run the project initialization`.

---

## Política multi-repo

- Se usa un solo `ia-context` por sistema, aunque existan varios repos de código.
- El escaneo inicial debe integrar backend + frontend (+ infra opcional) en un solo `codebase-analysis.md`.
- Si backend y frontend difieren en contratos, marcar ambigüedad y no asumir comportamiento.
- El backend es la fuente de verdad del modelo de datos y reglas transaccionales.

---

## Recibir actualizaciones del framework base

Este repo es un fork de `spec-driven-templates`. Para sincronizar mejoras:

```bash
git fetch upstream
git merge upstream/main --no-ff -m "chore: sync spec-driven-templates - <descripcion>"
git push origin main
```

Regla de conflictos:
- `ai-framework/` → priorizar upstream.
- `ai-workspace/` → priorizar local del proyecto.
