
# ai-workspace/

Carpeta de trabajo del proyecto. El equipo solo escribe en `specs/`. El agente gestiona el resto.

---

## Estructura de carpetas

| Carpeta | Quién la escribe | Cuándo | Paso |
|---|---|---|---|
| `specs/` | **El equipo** | Al inicio y por módulo nuevo | 1 — PRIMERO |
| `context/` | El agente (desde el spec) | Durante inicialización | 2 |
| `architecture/` | El agente (desde el spec) | Durante inicialización | 3 |
| `sprints/` | El agente (desde el spec) | Durante inicialización | 4 |
| `agents/` | El agente (base + dominio) | Durante inicialización | 4 |
| `execution/` | El agente | Al inicio de cada sesión | 5 |
| `state/` | El agente | Al completar cada tarea | 6 |
| `decisions/` | El agente | Al tomar decisiones arquitectónicas | 7 |
| `evidence/` | El agente | Al completar QA o releases | 8 |

---

## Detalle de cada carpeta y sus archivos

### `specs/` — Especificaciones del sistema
**Punto de partida de todo.** El único directorio que el equipo escribe manualmente.

| Archivo | Propósito |
|---|---|
| `init-spec.md` | Spec inicial completo: dominio, stack, requerimientos, actores, flujos, reglas de negocio, criterios de aceptación |
| `<modulo>.md` | Spec de un módulo específico (se crea al iniciar su desarrollo) |

Desde el spec inicial, el agente genera automáticamente usando `ai-framework/generators/`:

| Artefacto generado | Generator |
|---|---|
| `context/project.md` + `stack.md` | `context-generator.md` |
| `architecture/` | `architecture-generator.md` |
| `sprints/roadmap.md` + sprints | `sprint-generator.md` |
| `agents/` (incluye `caveman-agent.md`) | `agent-generator.md` |
| `ai-framework/standards/` | `standards-generator.md` |
| `AGENTS.md` | `agents-md-generator.md` |

---

### `context/` — Contexto persistente del proyecto
Se genera desde el spec. Se carga en **toda sesión** — mantener los archivos concisos (< 100 líneas cada uno).

| Archivo | Propósito |
|---|---|
| `project.md` | Dominio, objetivos, actores, glosario, out-of-scope |
| `stack.md` | Stack tecnológico, herramientas, convenciones |
| `conventions.md` | Reglas de naming y estructura específicas (opcional) |

> Si el spec cambia, regenerar el contexto afectado con `context-generator.md`.

---

### `architecture/` — Documentación de arquitectura
Se deriva de las specs y guía toda la implementación. Si la arquitectura cambia significativamente, registrar un ADR en `decisions/`.

| Archivo | Propósito | Cuándo crearlo |
|---|---|---|
| `system-overview.md` | Visión general del sistema y sus componentes | Al definir la arquitectura inicial |
| `frontend-architecture.md` | Estructura, patrones y flujos del frontend | Cuando el frontend tiene complejidad propia |
| `backend-architecture.md` | Capas, servicios, patrones del backend | Cuando el backend tiene complejidad propia |
| `security-architecture.md` | Modelo de autenticación, autorización y seguridad | Si hay requerimientos de seguridad específicos |
| `integration-architecture.md` | APIs externas, mensajería, integraciones | Si hay integraciones con sistemas externos |

---

### `sprints/` — Planificación incremental
Derivado del spec y la arquitectura. Los sprints deben ser incrementales con un goal claro y criterios de completitud medibles.

| Archivo | Propósito |
|---|---|
| `roadmap.md` | Fases de implementación del proyecto completo |
| `backlog.md` | Features priorizadas pendientes de implementar |
| `sprint-01.md` | Tareas, goal y criterios del primer sprint |
| `sprint-NN.md` | Tareas de cada sprint subsiguiente |

---

### `agents/` — Agentes del proyecto
Se generan durante la inicializacion para especializacion operativa.

| Archivo | Propósito |
|---|---|
| `caveman-agent.md` | Agente transversal de ahorro de tokens (base obligatoria) |
| `<domain>-agent.md` | Agentes especializados por dominio detectado en el spec |

---

### `execution/` — Estado de la tarea activa
El agente actualiza esta carpeta al inicio de cada sesión.

| Archivo | Propósito |
|---|---|
| `current-task.md` | Tarea activa: objetivo, scope, spec relacionada, riesgos y progreso |

> Si no hay tarea activa, el archivo queda con la plantilla vacía. El trabajo completado va en `state/`, no aquí.

---

### `state/` — Estado global del proyecto
El agente lo actualiza al completar features, ciclos de QA o releases. Se carga en toda sesión — mantenerlo actualizado y conciso.

| Archivo | Propósito |
|---|---|
| `project-status.md` | Estado general: sprint actual, features completos, blockers, QA |
| `completed-features.md` | Historial permanente de features entregados y validados |
| `known-issues.md` | Bugs conocidos y deuda técnica registrada |

---

### `decisions/` — Registro de decisiones arquitectónicas (ADRs)
Se registran durante la ejecución, cuando se toma una decisión que afecta la arquitectura, el stack o los patrones del sistema.

| Cuándo crear un ADR |
|---|
| Al elegir un patrón arquitectónico específico |
| Al adoptar una librería o framework con alternativas claras |
| Al cambiar algo ya documentado en arquitectura |
| Al resolver un tradeoff significativo |

Los ADRs se nombran secuencialmente: `ADR-001-<descripcion>.md`, `ADR-002-<descripcion>.md`, etc.
Son **inmutables** — no se editan, se superseden con un nuevo ADR.

Cada ADR debe contener: Contexto · Decisión · Consecuencias · Alternativas · Riesgos.

---

### `evidence/` — Evidencia de validación
El agente la puebla durante ciclos de QA y releases. No se elimina — es un historial permanente de trazabilidad.

```
evidence/
├── screenshots/    → Capturas de pantalla de validaciones visuales
├── coverage/       → Reportes de cobertura de tests
├── reports/        → Reportes de QA, performance o seguridad
└── releases/       → Paquetes y notas de cada release
```

---

## Cómo usar esto

### Proyecto existente / legacy / producción

```
1. Asegura acceso a repos de código (backend + frontend + infra opcional)
2. Ejecuta code-analysis-generator.md
   -> genera ai-workspace/context/codebase-analysis.md
3. Ejecuta spec-generator.md (reverse engineering)
   -> genera ai-workspace/specs/init-spec.md
4. Revisión humana del spec (modulos, reglas [inferred], open questions)
5. Ejecutar quality gate (spec_validate_quality_gate ok=true)
6. Run the project initialization
```

### Proyecto multi-repo (backend + frontend)

- Mantener un solo `ia-context` por sistema.
- Consolidar los repos en un solo `codebase-analysis.md`.
- Resolver inconsistencias entre frontend y backend antes de aprobar el spec.
- Tratar backend como fuente de verdad para entidades y reglas transaccionales.

### Mantenimiento del contexto persistente

- Baseline inicial: una sola vez al adoptar el framework.
- Actualización incremental: cuando cambien módulos, integraciones o contratos.
- Re-scan parcial: cuando haya drift en un módulo puntual.
- Re-scan completo: solo en cambios arquitectónicos grandes.

### Proyecto nuevo

**Opción A — Tienes documentos existentes (Word, PDF, notas, reuniones)**
```
1. Comparte los documentos con el agente
2. Dile: "Generate the init spec from these documents"
   → El agente produce ai-workspace/specs/init-spec.md usando spec-generator.md
3. Revisa y aprueba el spec generado
4. Dile: "Run the project initialization"
```

**Opción B — Partes desde cero**
```
1. Escribe ai-workspace/specs/init-spec.md con todo lo que sabes del proyecto
2. Dile: "Run the project initialization"
```

### Sesión de trabajo
```
1. Abre ai-workspace/sprints/sprint-NN.md
2. Dile al agente: "Implement task X" o "Let's work on [tarea]"
3. El agente carga el contexto, implementa y actualiza el estado solo
```

### Bug
```
Dile al agente: "There is a bug in [módulo]: [descripción]"
El agente lee el spec, diagnostica, corrige y registra evidencia
```

### Release
```
Dile al agente: "Prepare the release"
El agente valida, genera notas y registra evidencia
```

---

> El único archivo que el equipo escribe manualmente es el spec.
> Todo lo demás es responsabilidad del agente.
