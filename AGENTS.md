# Matchcota - AGENTS.md

Repositorio de contexto Spec-Driven para el MVP de Matchcota (app movil de match y chat para duenos de perros con geolocalizacion).

## Politicas obligatorias

- Ninguna implementacion inicia sin spec aprobado (gate GO).
- El archivo fuente de verdad es ai-workspace/specs/init-spec.md y sus extensiones por modulo.
- Cualquier cambio funcional debe trazarse a criterios de aceptacion de un spec.
- Nunca exponer coordenadas exactas de ubicacion de terceros en APIs o UI.
- Este repositorio (spec-driven-templates) es solo ia-context; no debe alojar codigo fuente de backend/frontend.

## Politicas de mantenimiento

- Mantener generators y orchestrators como unica fuente para flujo operativo.
- Actualizar contexto, arquitectura y sprints cuando cambie stack, alcance o decisiones clave.
- Evitar duplicidad de reglas entre ai-framework/standards.

## Flujo Spec-Driven operativo

1. Crear/actualizar spec del modulo en ai-workspace/specs/.
2. Ejecutar validacion con ai-workspace/agents/spec-validator-agent.md.
3. Implementar con ai-framework/orchestrators/feature-development-orchestrator.md.
4. Ejecutar QA con ai-framework/orchestrators/qa-orchestrator.md y publicar evidencia.
5. Actualizar estado en ai-workspace/state/project-status.md.

## Agentes activos del proyecto

- ai-workspace/agents/spec-author-agent.md
- ai-workspace/agents/spec-validator-agent.md
- ai-workspace/agents/caveman-agent.md
- ai-workspace/agents/discovery-geospatial-agent.md
- ai-workspace/agents/chat-realtime-agent.md

## Skills activas del proyecto

- ai-workspace/skills/spec-authoring-skill.md
- ai-workspace/skills/spec-validation-skill.md
- ai-workspace/skills/geospatial-discovery-skill.md
- ai-workspace/skills/match-chat-flow-skill.md

## Orchestrators disponibles

- Run the project initialization -> ai-framework/orchestrators/project-init-orchestrator.md
- Implement task [nombre] -> ai-framework/orchestrators/feature-development-orchestrator.md
- There is a bug in [modulo]: [descripcion] -> ai-framework/orchestrators/bugfix-orchestrator.md
- Validate this task -> ai-framework/orchestrators/qa-orchestrator.md
- Prepare the release -> ai-framework/orchestrators/release-orchestrator.md
