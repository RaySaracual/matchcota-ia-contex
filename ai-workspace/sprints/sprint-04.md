# Sprint 04 - Product Hardening + Ops Baseline

## Sprint Goal

Convertir el MVP funcional en una base estable para beta controlada, cerrando gaps del backlog
(terminar BL-002 y consolidar BL-007/BL-008) y reduciendo riesgos de sesion/chat en entornos
multicliente (Windows + Web).

## Context (base del sprint anterior)

- Sprint 03 cerrado con chat realtime, multimedia, docker compose y evidencia consolidada.
- Riesgos observados durante validacion manual: estabilidad de sesiones en multiplataforma,
  visibilidad operacional limitada para diagnostico rapido.
- Backlog pendiente de consolidacion operativa: BL-002 (CRUD completo), BL-007 (pipeline robusto),
  BL-008 (observabilidad accionable).

## Backlog Alignment

- BL-002 | Completar CRUD perfil de perro (actualmente create + media + mine).
- BL-007 | Fortalecer CI/CD con gates de calidad y smoke checks.
- BL-008 | Expandir observabilidad para diagnostico de auth/chat/discovery.

## Features

- Perfil canino completo: actualizar y desactivar perfil propio.
- Estabilidad de sesion y chat en multiplataforma.
- Observabilidad accionable en flujo critico (auth -> discovery -> match -> chat).
- Pipeline CI/CD reforzado para prevenir regresiones de runtime.

## Tasks

### BL-002 - Perfil canino completo

1. [x] Backend: `PUT /api/v1/dogs/{dogId}` para editar nombre, raza, bio y coordenadas.
2. [x] Backend: `PATCH /api/v1/dogs/{dogId}/status` para activar/desactivar perfil.
3. [x] Frontend: edicion de perfil en `ProfilePage` con feedback de guardado.
4. [x] Frontend: toggle de estado activo/inactivo del perro.
5. [x] Tests: servicio/controlador Dogs + widgets de edicion/perfil.

### BL-007 - CI/CD baseline robusto

1. [x] Backend CI: agregar `dotnet format --verify-no-changes` y `dotnet test` por PR.
2. [x] Frontend CI: agregar `flutter analyze` y `flutter test` por PR.
3. [x] Pipeline: smoke check post-build (API healthz + arranque basico).

### BL-008 - Observabilidad operativa

1. [x] Backend: correlacion de request-id en logs y errores (auth/chat/discovery).
2. [x] Backend: logging estructurado de eventos de chat (join/leave/send/error) sin exponer PII sensible.
3. [x] Frontend: telemetry de estado de conexion de chat (connected/error/reconnecting) para diagnostico local.

### Stabilization (post-Sprint 03 learnings)

1. [x] Frontend: endurecer manejo de sesiones concurrentes (limpieza de token y relogin claro ante 401).
2. [x] Frontend: fallback UX cuando chat realtime cae (banner persistente + retry manual).
3. [x] QA: test manual cruzado Windows + Chrome con checklist reproducible.

## Dependencies

- BL-005 cerrado (chat base operativo).
- BL-002 media upload existente reutilizable para perfil editable.
- Entorno local con PostgreSQL disponible para smoke y QA cruzado.

## Risks

- Cambios de perfil pueden impactar discovery si no se invalidan caches/providers.
- Logging excesivo en chat puede introducir ruido o fuga de datos si no se filtra.
- Diferencias de plataforma (Windows/Web) en storage/sesion.

## QA Scope

- Verificar CRUD completo de perfil (create/read/update/activate/deactivate).
- Verificar estabilidad del chat realtime en dos clientes simultaneos.
- Verificar que 401 fuerza relogin consistente y recuperable.
- Verificar pipeline verde en PR con analyze/test/smoke.

## Acceptance Criteria

- Usuario puede editar y activar/desactivar su perfil de perro sin romper discovery.
- Chat mantiene comportamiento realtime estable en dos clientes simultaneos.
- Pipeline CI bloquea merges con errores de formato, analisis o tests.
- Logs permiten rastrear fallos de auth/chat/discovery en menos de 5 minutos.

## Evidence Required

- Video corto: editar perfil -> ver cambios en app.
- Video corto: chat realtime Windows vs Chrome estable.
- Captura de pipeline backend/frontend en verde.
- Extracto de logs estructurados con correlacion de request-id.
