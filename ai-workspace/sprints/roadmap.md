# Roadmap - Matchcota MVP

## Release Goal

Entregar MVP funcional con auth, perfil canino, discovery geoespacial, match mutuo y chat.

## Sprint Plan

- Sprint 01: Fundaciones tecnicas y contratos base.
- Sprint 02: Discovery geoespacial + swipe + match.
- Sprint 03: Chat en tiempo real + estabilizacion + release readiness.
- Sprint 04: Hardening post-MVP + cierre de gaps de backlog (BL-002 completo, BL-007/BL-008 baseline productivo).
- Sprint 05: Beta MVP readiness (inbox de chats, seguridad de sesion y safety controls).

## Milestones

1. Arquitectura base y pipeline CI/CD operativos.
2. Flujo end-to-end de discovery y matching validado.
3. Flujo de chat y evidencia QA para salida MVP.
4. Baseline operable para beta controlada (calidad, observabilidad y robustez de sesion/chat).
5. Beta MVP utilizable por usuarios piloto con inbox funcional y controles de seguridad basicos.

## Risks

- Ajuste de rendimiento en queries PostGIS.
- Complejidad de sincronizacion realtime en chat.
- Dependencia del proveedor de almacenamiento multimedia.
