# Current Task

## Active Task

Start Sprint 2

## Objective

Implementar el flujo funcional de discovery geoespacial con swipe y creacion de match mutuo, integrado entre backend y frontend.

## Scope

**In scope:**

- Contratos y endpoints de discovery, swipe y matches protegidos con JWT.
- Logica de negocio para candidatos cercanos y match mutuo.
- Integracion de pantalla discovery Flutter con backend real.
- Pruebas backend/frontend del flujo discovery -> swipe -> match.

**Out of scope:**

- Chat en tiempo real completo (Sprint 03).
- Observabilidad avanzada y optimizacion de costos cloud.

## Related Spec

ai-workspace/specs/init-spec.md

## Active Risks

- Complejidad de consultas geoespaciales sin indice GIST correcto.
- Riesgo de fugas de privacidad de ubicacion por DTOs mal diseniados.

## Progress

- Sprint 01 cerrado con 6/6 tareas completadas.
- Sprint 02 definido en ai-workspace/sprints/sprint-02.md.
- Gap confirmado: discovery/chat en frontend aun en placeholder.

## Next Steps

1. Implementar endpoint `GET /api/v1/discovery/candidates` (BL-003).
2. Implementar endpoint `POST /api/v1/discovery/swipes` con match mutuo (BL-004).
3. Conectar `features/discovery` en Flutter al backend y reemplazar placeholders.

## Last Updated

2026-07-17
