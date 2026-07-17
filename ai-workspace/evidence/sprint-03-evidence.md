# Sprint 03 - Evidence Log

## Metadata

- Sprint: sprint-03
- Date: 2026-07-17
- Status: Cerrado

## Automated Validation

- Backend tests (xUnit): PASS (10/10)
  - Command: dotnet test Matchcota.Tests\\Matchcota.Tests.csproj
- Frontend tests (Flutter): PASS (15/15)
  - Command: flutter test

## Functional Evidence Checklist

- [x] Captura o video del flujo: match -> abrir chat -> enviar mensaje -> recibir en tiempo real.
- [x] Captura del perro con foto visible en discovery card.
- [x] Salida de docker-compose up exitosa.
- [x] Verificacion del healthcheck del servicio api en compose.

## Docker Evidence (captured)

- `docker compose config`: valido.
- `docker compose up --build -d`: build e inicio de servicios completado.
- `docker compose ps`: `matchcota-api` healthy y `matchcota-db` healthy.
- `docker compose down`: limpieza de entorno ejecutada.

## Release Notes Block

Sprint 03 (Chat en Tiempo Real + Release Readiness) queda cerrado a nivel tecnico.

- Backend:
  - ChatHub SignalR con autorizacion por match.
  - Endpoints REST de chat (`GET/POST /api/v1/chat/{matchId}/messages`).
  - Upload multimedia `POST /api/v1/dogs/{dogId}/media` con validaciones (tamano y tipo).
  - Middleware global de excepciones + logs estructurados con Serilog.
- Frontend:
  - Chat realtime con `signalr_netcore`, reconexion exponencial y fallback HTTP.
  - ConversationPage integrada desde MatchesPage.
  - Manejo de token expirado (401) con auto-logout y feedback al usuario.
- Calidad:
  - Backend tests: 10/10 PASS.
  - Frontend tests: 15/15 PASS.
  - Docker Compose validado con servicios api/db en estado healthy.

Sprint 03 cerrado documental y tecnicamente.

## Notes

- Evidencia funcional y tecnica consolidada para auditoria de cierre.
