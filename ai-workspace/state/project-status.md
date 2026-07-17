# Project Status

## Overall Status

ACTIVE

## Current Sprint

sprint-05 — Beta MVP Readiness (planificado)

## Completed Features

- Inicializacion de artefactos Spec-Driven completada.
- Sprint 01 - Tarea 1 completada: estructura backend .NET en capas compilable.
- Sprint 01 - Tarea 2 completada: DbContext y esquema inicial Code First con migracion de dominio.
- Sprint 01 - Tarea 3 completada: autenticacion con JWT y endpoints base de auth.
- Sprint 01 - Tarea 4 completada: esqueleto Flutter feature-first en repositorio frontend separado.
- Sprint 01 - Tarea 5 completada: cliente HTTP y sesion JWT integrados en frontend.
- Sprint 01 - Tarea 6 completada: pipelines GitHub Actions en repos backend/frontend.
- Sprint 02 - Tarea 1 completada: contratos API Discovery (DTOs versionados en api/v1).
- Sprint 02 - Tarea 2 completada: DiscoveryService (candidatos geoespaciales, paginado, privacidad coordenadas).
- Sprint 02 - Tarea 3 completada: SwipeService (idempotente, match mutuo con ordering canonica).
- Sprint 02 - Tarea 4 completada: DogsService + endpoint GET /api/v1/dogs/mine.
- Sprint 02 - Tarea 5 completada: DiscoveryController (GET candidates, POST swipes, GET matches) + DogsController protegidos con JWT.
- Sprint 02 - Tarea 6 completada: flutter_riverpod integrado, ProviderScope en main, DiscoveryNotifier con prefetch.
- Sprint 02 - Tarea 7 completada: UI real discovery — DogCard swipe gesture, SwipeActionBar, MatchCelebrationDialog, MatchesPage.
- Sprint 02 - Tarea 8 completada: 14 tests pasando (widgets DogCard, SwipeActionBar, ageLabel, shell).
- Sprint 02 - Tarea 9 completada: POST /api/v1/dogs + ProfilePage con formulario de registro de perro.
- Sprint 02 - Tarea 10 completada: 8 tests xUnit SwipeService (ownership, idempotencia, match mutuo, ordering canonico).
- Sprint 02 - Tarea 11 completada: seed-dev-data.ps1 — script idempotente valida flujo end-to-end con match confirmado.
- Sprint 02 - CERRADO: todos los criterios de aceptacion verificados en vivo.
- Sprint 03 - Tareas completadas: ChatHub SignalR, endpoints chat REST, chat realtime frontend, navegacion desde matches, upload de foto, middleware global de excepciones + Serilog, auto-logout por 401.
- Sprint 03 - Pruebas completadas: backend 10/10 y frontend 15/15 en verde.
- Sprint 03 - CERRADO: evidencia funcional y tecnica registrada.
- Sprint 04 - CERRADO: BL-002, BL-007, BL-008 y Stabilization completados.

## Next Sprint Focus

- Sprint 05 - Beta MVP Readiness
  - BL-009: Seguridad de sesion (refresh token + revocacion)
  - BL-010: Inbox de chats y no leidos
  - BL-011: Safety controls (reportar/bloquear)

## In Progress

- Ninguno.

## Blocked

- Task: N/A
- Blocker: N/A
- Owner: N/A

## Known Issues

- Ninguno registrado al cierre de la inicializacion.

## QA Status

- Inicializacion de contexto: Pass
- Sprint 01: Pass (Evidence: ai-workspace/sprints/sprint-01.md)
- Sprint 02: PASS — Cerrado 2026-07-17
  - Backend build: 0 errores, 0 advertencias
  - Tests backend xUnit: 8/8 Pass (SwipeService)
  - Tests frontend Flutter: 14/14 Pass
  - flutter analyze: 0 issues
  - Smoke test end-to-end: registro, creacion de perro, discovery, swipe, match confirmado via seed-dev-data.ps1
  - Privacidad coordenadas: verificada (solo distanceKm expuesto en DTOs)
- Sprint 03: PASS TECNICO — Corte tecnico 2026-07-17
  - Tests backend xUnit: 10/10 Pass
  - Tests frontend Flutter: 15/15 Pass
  - Chat realtime, upload multimedia y manejo de sesion expirada implementados
  - Docker Compose validado: config valido, up --build exitoso, api/db healthy
- Sprint 03: PASS FINAL — Cerrado 2026-07-17
  - Evidencia funcional y tecnica consolidada en ai-workspace/evidence/sprint-03-evidence.md
- Sprint 04: PASS FINAL — Cerrado 2026-07-17
  - Backend CI: dotnet format --verify-no-changes + dotnet test por PR
  - Frontend CI: flutter analyze + flutter test por PR
  - Smoke check API healthz post-build habilitado en workflow backend
  - Observabilidad operativa y estabilizacion Windows + Chrome completadas

## Last Updated

2026-07-17
