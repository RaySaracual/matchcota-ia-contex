# Spec-Driven Development - Instrucciones de Agente

Este repositorio contiene plantillas y reglas Spec-Driven para uso generico en editores e IDEs.

## Politica obligatoria

- Todo requerimiento nuevo requiere spec aprobado antes de iniciar desarrollo.
- Sin gate GO (`spec_validate_quality_gate ok=true`), el desarrollo esta bloqueado.
- El spec es la unica fuente de verdad para criterios de aceptacion, contratos y trazabilidad.

### Adopcion en sistemas existentes (legacy / produccion)

- Si no existe `ai-workspace/specs/init-spec.md` pero existe codigo, ejecutar primero analisis de codigo (Phase 0).
- Consolidar backend + frontend (+ infra opcional) en un unico `ai-workspace/context/codebase-analysis.md`.
- Generar `init-spec.md` por reverse engineering y marcar inferencias antes de aprobar.
- No ejecutar implementacion sin validacion humana del spec y gate GO.

## Politica de mantenimiento

- No duplicar reglas ni templates entre carpetas.
- Los generators en `ai-framework/generators/` son la unica fuente de verdad para producir artefactos.
- Los orchestrators en `ai-framework/orchestrators/` definen el orden de ejecucion — no improvisar pasos.

## Flujo Spec-Driven por feature

1. Escribir spec en `ai-workspace/specs/<modulo>.md`.
2. Validar gate con `spec_validate_quality_gate` (MCP).
3. Implementar contra criterios de aceptacion del spec siguiendo `ai-framework/orchestrators/feature-development-orchestrator.md`.
4. Generar casos QA y publicar evidencia con `qa_generate_and_publish_evidence` (MCP).
5. Hacer code review trazado al spec antes de mergear.

## Orchestrators disponibles

| Instruccion al agente | Orchestrator |
|---|---|
| *(inicio de sesion)* | `ai-framework/orchestrators/session-init-orchestrator.md` |
| `Run the project initialization` | `ai-framework/orchestrators/project-init-orchestrator.md` |
| `Implement task <nombre>` | `ai-framework/orchestrators/feature-development-orchestrator.md` |
| `There is a bug in <modulo>: <descripcion>` | `ai-framework/orchestrators/bugfix-orchestrator.md` |
| `Validate this task` | `ai-framework/orchestrators/qa-orchestrator.md` |
| `Prepare the release` | `ai-framework/orchestrators/release-orchestrator.md` |

## Agente Caveman (ahorro de tokens)

- Agente base recomendado: `ai-workspace/agents/caveman-agent.md`.
- Rol: reducir consumo de tokens con respuestas compactas y ejecucion enfocada.
- Limite: no reemplaza agentes de dominio para decisiones de negocio o arquitectura.
