# ai-framework/

Inteligencia reutilizable del framework. El agente la consulta para operar — el equipo no la toca.

---

## Qué hay aquí y para qué sirve

### `generators/` — Cómo producir artefactos

El agente los usa durante la inicialización del proyecto y cuando se agregan módulos nuevos.

| Generator | Produce |
|---|---|
| `spec-generator.md` | `ai-workspace/specs/*.md` |
| `context-generator.md` | `ai-workspace/context/project.md` + `stack.md` |
| `architecture-generator.md` | `ai-workspace/architecture/*.md` |
| `sprint-generator.md` | `ai-workspace/sprints/roadmap.md` + sprints |
| `standards-generator.md` | Standards ajustados al stack real del proyecto |
| `agent-generator.md` | `ai-workspace/agents/*.md` (solo si el spec los justifica) |
| `skill-generator.md` | `ai-workspace/skills/*.md` (solo patrones reutilizables reales) |
| `workflow-generator.md` | `ai-workspace/workflows/*.md` |
| `agents-md-generator.md` | `AGENTS.md` raíz del repo |

### `orchestrators/` — Cuándo y cómo ejecutar

Los orchestrators coordinan cómo se produce y valida el trabajo. Cada uno define un flujo paso a paso que el agente sigue para garantizar que nada quede sin hacer: cargar contexto, consultar el spec correcto, aplicar standards, generar entregables y registrar evidencia.

El agente elige el orchestrator según la operación. El equipo solo dice qué quiere hacer.

| Orchestrator | Qué coordina | El equipo dice... |
|---|---|---|
| `session-init-orchestrator.md` | Carga contexto, estado y tarea activa al inicio de cada sesión | *(automático — no requiere instrucción)* |
| `project-init-orchestrator.md` | Ejecuta todos los generators en orden desde el spec inicial | *"Run the project initialization"* |
| `feature-development-orchestrator.md` | Carga spec relevante → aplica standards → implementa → registra evidencia | *"Implement task X"* |
| `bugfix-orchestrator.md` | Lee spec → diagnostica → corrige → valida que no rompe nada → registra | *"There is a bug in [módulo]: [descripción]"* |
| `qa-orchestrator.md` | Valida criterios del spec → regresión → compliance → registra evidencia | *"Validate this task"* |
| `release-orchestrator.md` | Valida estado general → genera release notes → registra evidencia | *"Prepare the release"* |

> Los orchestrators no improvisan. Cada paso está definido en su archivo y el agente debe seguirlo en orden.

### `standards/` — Reglas de calidad del proyecto

Estándares base que el agente ajusta al stack y dominio real con `standards-generator.md`.
No son reglas globales fijas — se sobreescriben según el proyecto.

`coding-style` · `api-standards` · `frontend-standards` · `backend-standards`
`testing-standards` · `security-standards` · `git-strategy` · `documentation-standards`

---

## Cuándo modificar esta carpeta

| Situación | Acción |
|---|---|
| Proyecto nuevo | No tocar — el agente la usa como está |
| El stack del proyecto es diferente a los standards base | Ejecutar `standards-generator.md` para ajustarlos |
| Se detecta un dominio que necesita un agente especializado | Ejecutar `agent-generator.md` |
| El framework necesita un nuevo tipo de generator u orchestrator | Agregar el archivo correspondiente aquí |
—      → ai/decisions/                      (durante ejecución)
—      → ai/evidence/                       (durante QA y releases)
```

---

## Cómo usar este framework

1. **Generar artefactos**: usa el generator correspondiente según lo que necesitas producir.
2. **Ejecutar ciclos de vida**: sigue el orchestrator adecuado para la operación (feature, bug, QA, release).
3. **Validar calidad**: el agente aplica los standards durante toda la ejecución.

> Los generators producen los artefactos que van en `ai-workspace/`.  
> Los orchestrators coordinan cómo se produce y valida el trabajo.  
> Los standards definen la calidad mínima aceptable.
