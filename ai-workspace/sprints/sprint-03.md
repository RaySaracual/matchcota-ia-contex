# Sprint 03 - Chat en Tiempo Real + Release Readiness

## Sprint Goal

Completar el flujo de valor MVP: chat en tiempo real entre matches, foto de perfil del perro,
observabilidad minima y empaquetado Docker para deployment. Al cierre de este sprint el producto
es deployable end-to-end.

## Context (base del sprint anterior)

- Auth JWT operativo (BL-001 cerrado).
- Discovery + swipe + match funcionando (BL-003, BL-004, BL-006 cerrados).
- Deuda tecnica activa: Haversine en lugar de PostGIS (aceptado para dev/MVP),
  sin token-refresh automatico, sin manejo de errores global en backend.

## Features

- Chat en tiempo real via SignalR entre dos perros con match activo.
- Historial de mensajes persistido y paginado.
- Upload de foto de perfil del perro (1 foto principal).
- Docker Compose deployable (PostgreSQL + API).
- Observabilidad minima: logs estructurados y manejo global de excepciones.
- Estabilizacion frontend: token expirado manejado con auto-logout.

## Tasks

### Chat (BL-005)

1. [x] Backend: implementar `ChatHub` con SignalR.
   - Sala de chat identificada por `matchId`.
   - Acceso restringido a los dos duenos del match (verificacion con JWT).
   - Metodo `SendMessage(matchId, content)` persiste el mensaje y lo difunde a la sala.
2. [x] Backend: endpoints REST de chat.
   - `GET /api/v1/chat/{matchId}/messages?page=1&pageSize=30` — historial paginado.
   - `POST /api/v1/chat/{matchId}/messages` — fallback HTTP para envio sin WebSocket.
   - Ambos protegidos con JWT y verificacion de pertenencia al match.
3. [x] Frontend: integrar paquete `signalr_netcore`.
   - Proveedor Riverpod `chatConnectionProvider` que gestiona ciclo de vida de HubConnection.
   - Reconexion automatica con back-off exponencial.
4. [x] Frontend: `ConversationPage` — sala de chat en tiempo real.
   - Lista de mensajes con scroll-to-bottom automatico al recibir nuevo mensaje.
   - Input con envio por boton y por Enter.
   - Indicador de conexion (conectando / conectado / error).
5. [x] Frontend: navegar a `ConversationPage` desde `MatchesPage` al tocar un match.
6. [x] Tests: ChatService (autorizacion de sala, persistencia de mensaje) + widget ConversationPage.

### Multimedia (BL-002 foto de perro)

7. [x] Backend: `POST /api/v1/dogs/{dogId}/media` — multipart upload.
   - Almacenamiento local en `wwwroot/uploads/` (dev); configurable via `IStorageService`.
   - Limitar a 5 MB, tipos permitidos: jpg, png, webp.
   - Retornar URL publica del archivo.
8. [x] Frontend: selector de imagen en `ProfilePage` con `image_picker`.
   - Boton "Agregar foto" bajo el avatar en `_DogProfileView`.
   - Preview inmediato tras seleccion y upload automatico.
   - Invalidar `myFirstDogProvider` tras upload exitoso para refrescar foto en discovery.

### Release Readiness

9. [x] Backend: `docker-compose.yml` en raiz del repositorio.
   - Servicios: `db` (postgres:16-alpine) y `api` (imagen build desde Matchcota.Api).
   - Variables de entorno externalizadas via `.env.example`.
   - Health check en `api` dependiente de `db` listo.
10. [x] Backend: global exception middleware + Serilog.
    - Capturar excepciones no controladas y retornar ProblemDetails estandar.
    - Logs estructurados JSON en archivo y consola (nivel configurable).
    - Log de request/response para endpoints criticos (auth, swipe, chat).
11. [x] Frontend: manejo de token expirado.
    - Interceptor Dio detecta 401 y limpia sesion.
    - Redirige al tab de Auth con mensaje "Sesion expirada. Inicia sesion de nuevo."

## Dependencies

- BL-004 cerrado (match activo requerido para sala de chat).
- Decision de storage multimedia: para MVP usar filesystem local; IStorageService permite sustituir S3 sin cambiar logica.
- SignalR requiere WebSockets habilitado en el servidor de produccion.

## Risks

- Reconexion SignalR en condiciones de red movil inestable — mitigar con retry automatico y estado visual claro.
- Upload de archivos en Windows Desktop (flutter_windows) puede requerir configuracion extra de `image_picker`.
- Docker build puede fallar si la connection string de produccion no esta configurada — mitigar con `.env.example` bien documentado.

## QA Scope

- Validar que solo los duenos del match pueden enviar y recibir mensajes en esa sala.
- Validar que mensajes persisten y son recuperables desde historial.
- Verificar reconexion automatica tras perdida de red.
- Validar limite de tamano y tipo de archivo en upload.
- Verificar que `docker-compose up` levanta la aplicacion sin configuracion manual.

## Acceptance Criteria

- Dos usuarios con match pueden intercambiar mensajes en tiempo real desde la app.
- Historial de mensajes disponible al reabrir la conversacion.
- Perro con foto muestra la imagen en tarjeta de discovery y en matches.
- `docker-compose up` arranca el sistema completo sin pasos adicionales.
- Token expirado cierra sesion automaticamente con feedback claro al usuario.
- Tests del sprint pasan en CI.

## Evidence Required

- Captura o video del flujo: match -> abrir chat -> enviar mensaje -> recibir en tiempo real.
- Captura del perro con foto visible en discovery card.
- Output de `docker-compose up` exitoso.
- Reporte de tests backend y frontend en verde.

## Sprint Execution Status

- Estado: CERRADO.
- Fecha de corte tecnico: 2026-07-17.
- Validacion automatizada:
   - Backend xUnit: 10/10 tests en verde.
   - Frontend Flutter: 15/15 tests en verde.
   - `docker compose config`: valido.
   - `docker compose up --build -d`: stack levantado correctamente.
   - `docker compose ps`: `db` y `api` en estado healthy.
- Cierre documental:
   - Evidencia funcional consolidada en `ai-workspace/evidence/sprint-03-evidence.md`.
