# spec-driven-templates

Framework de desarrollo guiado por especificaciones (Spec-Driven Development) para equipos que usan agentes de IA (GitHub Copilot, Cursor, etc.).

Provee dos cosas: la inteligencia reutilizable del agente (`ai-framework/`) y la estructura de trabajo del proyecto (`ai-workspace/`).

---

## Estructura del repositorio

```
spec-driven-templates/
├── ai-framework/          # Inteligencia del agente — el equipo NO la toca
│   ├── generators/        # Producen artefactos en ai-workspace/
│   ├── orchestrators/     # Coordinan los flujos de trabajo (feature, bugfix, QA, release)
│   └── standards/         # Reglas de calidad ajustables por stack
└── ai-workspace/          # Área de trabajo del proyecto — el equipo escribe aquí
    ├── specs/             # EL EQUIPO escribe aquí primero
    ├── context/           # El agente genera y mantiene
    ├── architecture/      # El agente genera y mantiene
    ├── agents/            # El agente genera y mantiene
    ├── sprints/           # El agente genera y mantiene
    ├── execution/         # El agente actualiza al inicio de cada sesión
    ├── state/             # El agente actualiza al completar tareas
    ├── decisions/         # El agente registra decisiones arquitectónicas
    └── evidence/          # El agente publica resultados de QA y releases
```

---

## Cómo usar este framework

### Paso 1 — Copiar la estructura al proyecto

Copia las carpetas `ai-framework/` y `ai-workspace/` a la raíz del repositorio del proyecto donde quieres aplicar el flujo.

```
mi-proyecto/
├── ai-framework/    ← copiado de aquí
├── ai-workspace/    ← copiado de aquí
├── src/
└── ...
```

> Alternativa: clonar este repo y trabajar directamente sobre él si el proyecto es nuevo.

### Paso 2 — Escribir el spec inicial

El **único archivo que el equipo escribe a mano** para comenzar es:

```
ai-workspace/specs/init-spec.md
```

El spec debe cubrir: dominio del sistema, stack tecnológico, actores, requerimientos funcionales y no funcionales, flujos principales, reglas de negocio y criterios de aceptación iniciales.

> No hay formato libre. El agente espera un spec estructurado. Usar el spec inicial incluido como referencia: [`ai-workspace/specs/init-spec.md`](ai-workspace/specs/init-spec.md).

### Paso 3 — Inicializar el proyecto con el agente

Con el spec completo, decirle al agente:

```
Run the project initialization
```

El agente ejecuta [`ai-framework/orchestrators/project-init-orchestrator.md`](ai-framework/orchestrators/project-init-orchestrator.md), que invoca todos los generators en orden y produce:

| Artefacto generado | Ubicación |
|---|---|
| Contexto del proyecto | `ai-workspace/context/project.md` + `stack.md` |
| Documentación de arquitectura | `ai-workspace/architecture/` |
| Roadmap y sprints | `ai-workspace/sprints/` |
| Agentes de dominio | `ai-workspace/agents/` |
| Standards ajustados al stack | `ai-framework/standards/` |
| `AGENTS.md` raíz del repo | `/AGENTS.md` |

### Paso 4 — Flujo de trabajo por feature

Una vez inicializado el proyecto, cada ciclo de trabajo sigue este flujo:

```
[equipo] Escribir spec de feature en ai-workspace/specs/<modulo>.md
         ↓
[agente] Implement task <nombre> → feature-development-orchestrator.md
         ↓
[equipo] Revisar implementación
         ↓
[agente] Validate this task → qa-orchestrator.md
         ↓
[agente] Prepare the release → release-orchestrator.md  (cuando corresponda)
```

Para bugs:
```
[equipo] There is a bug in <módulo>: <descripción>
[agente] → bugfix-orchestrator.md
```

---

## Orchestrators disponibles

| Qué decirle al agente | Orchestrator que ejecuta | Cuándo |
|---|---|---|
| *(automático al iniciar sesión)* | `session-init-orchestrator.md` | Cada vez que se abre el editor |
| `Run the project initialization` | `project-init-orchestrator.md` | Una vez, al comenzar el proyecto |
| `Implement task <nombre>` | `feature-development-orchestrator.md` | Por cada feature o tarea |
| `There is a bug in <módulo>: <descripción>` | `bugfix-orchestrator.md` | Al detectar un bug |
| `Validate this task` | `qa-orchestrator.md` | Al completar implementación |
| `Prepare the release` | `release-orchestrator.md` | Al preparar un release |

---

## Generators disponibles

Los generators son invocados por los orchestrators. No se llaman directamente salvo para casos específicos.

| Generator | Produce |
|---|---|
| `spec-generator.md` | Spec de feature en `ai-workspace/specs/` |
| `context-generator.md` | `context/project.md` + `context/stack.md` |
| `architecture-generator.md` | `architecture/*.md` |
| `sprint-generator.md` | `sprints/roadmap.md` + sprints individuales |
| `standards-generator.md` | Standards ajustados al stack real |
| `agent-generator.md` | Agentes de dominio en `ai-workspace/agents/` |
| `skill-generator.md` | Skills reutilizables en `ai-workspace/skills/` |
| `workflow-generator.md` | Workflows en `ai-workspace/workflows/` |
| `agents-md-generator.md` | `AGENTS.md` raíz del repo |

---

## Standards base

El agente ajusta estos standards al stack real del proyecto usando `standards-generator.md`. No son fijos globalmente — se sobreescriben por proyecto.

`coding-style` · `api-standards` · `frontend-standards` · `backend-standards`  
`testing-standards` · `security-standards` · `git-strategy` · `documentation-standards`

---

## Reglas de uso

- El equipo **solo escribe en `ai-workspace/specs/`**. El resto lo gestiona el agente.
- El agente **solo escribe fuera de `ai-workspace/specs/`**. No modifica specs sin instrucción explícita.
- Los orchestrators definen pasos fijos que el agente debe seguir en orden, sin improvisar.
- Si el stack del proyecto difiere de los standards base, ejecutar `standards-generator.md` para ajustarlos antes de iniciar desarrollo.
- Ver [`AGENTS.md`](AGENTS.md) para la política completa del agente en este repositorio.
