# Project Status

## Overall Status

ACTIVE

## Current Sprint

sprint-03 — Chat + Release Readiness (planificado, listo para ejecucion)

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

## Last Updated

2026-07-17
