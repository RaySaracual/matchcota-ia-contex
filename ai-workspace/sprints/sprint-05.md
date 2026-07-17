# Sprint 05 - Beta MVP Readiness (Inbox + Session Security + Safety)

## Sprint Goal

Preparar Matchcota para beta controlada con funcionalidad de uso diario: inbox real de chats,
seguridad de sesion reforzada y controles basicos de seguridad de comunidad.

## Context (base del sprint anterior)

- Sprint 04 cerrado: BL-002, BL-007, BL-008 y stabilization completados.
- El core MVP funciona end-to-end (auth, profile, discovery, match, chat realtime).
- Gap principal para beta piloto: falta inbox operativo de chats y controles de cuenta/comunidad.

## Backlog Alignment

- BL-009 | Seguridad de sesion (refresh token + revocacion).
- BL-010 | Inbox de chats + contador de no leidos.
- BL-011 | Safety controls (reportar y bloquear perfiles).

## Features

- Sesion renovable con refresh token y revocacion server-side.
- Pantalla de inbox de conversaciones con ultimo mensaje y fecha.
- Indicador de no leidos por conversacion y reseteo al abrir chat.
- Acciones de reportar y bloquear dentro de flujo de profile/chat/matches.

## Tasks

### BL-009 - Seguridad de sesion

1. [ ] Backend: agregar refresh tokens persistidos (`POST /api/v1/auth/refresh`, `POST /api/v1/auth/logout-all`).
2. [ ] Backend: invalidar refresh token en logout y rotar token en cada refresh exitoso.
3. [ ] Frontend: interceptor Dio con refresh automatico ante 401 (una sola vez por request).
4. [ ] Frontend: fallback a relogin solo si refresh falla/revocado.
5. [ ] Tests: backend auth refresh/revocation + frontend flujo refresh success/fail.

### BL-010 - Inbox de chats y no leidos

1. [ ] Backend: endpoint `GET /api/v1/chat/conversations` con ultimo mensaje, timestamp y unreadCount.
2. [ ] Backend: endpoint `POST /api/v1/chat/{matchId}/read` para marcar mensajes como leidos.
3. [ ] Frontend: reemplazar placeholder `ChatPage` por lista real de conversaciones.
4. [ ] Frontend: badge de no leidos en lista e integracion con `ConversationPage` para reset de contador.
5. [ ] Tests: servicio/controlador chat inbox + widgets de lista inbox.

### BL-011 - Safety controls

1. [ ] Backend: `POST /api/v1/safety/report` (categoria + detalle) con auditoria basica.
2. [ ] Backend: `POST /api/v1/safety/block/{dogId}` y `DELETE /api/v1/safety/block/{dogId}`.
3. [ ] Backend: excluir perfiles bloqueados en discovery/matches/chat queries.
4. [ ] Frontend: acciones "Reportar" y "Bloquear" en UI de perfil/conversacion.
5. [ ] Tests: reglas de exclusión de bloqueados y paths principales de report/block.

## Dependencies

- BL-005 operativo (chat base).
- BL-007/BL-008 cerrados para soportar cambios con gates y trazabilidad.
- Migraciones de DB disponibles para tablas de refresh tokens y safety events.

## Risks

- Complejidad de concurrencia al refrescar token desde multiples requests simultaneos.
- Riesgo de UX confusa si no se sincroniza unreadCount entre realtime y polling.
- Safety mal configurado puede causar falsos bloqueos o bypass de filtros.

## QA Scope

- Verificar refresh token exitoso y revocacion efectiva (logout-all).
- Verificar inbox funcional con contador de no leidos actualizado.
- Verificar bloqueo: perfil bloqueado desaparece de discovery/matches/chat.
- Verificar reporte de usuario con payload y persistencia correcta.

## Acceptance Criteria

- Usuario mantiene sesion activa sin relogin frecuente mientras refresh sea valido.
- Inbox de chats muestra conversaciones reales y no leidos consistentes.
- Usuario puede reportar y bloquear; perfiles bloqueados no vuelven a aparecer.
- Tests del sprint en verde en backend y frontend.

## Evidence Required

- Video: flujo refresh automatico + fallback a relogin cuando refresh falla.
- Capturas inbox con no leidos y actualizacion al abrir conversacion.
- Video/capturas de reportar y bloquear perfil con efecto visible en discovery.
- Pipeline backend/frontend en verde con tests de sprint.
