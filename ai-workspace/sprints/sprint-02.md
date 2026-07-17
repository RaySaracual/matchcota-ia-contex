# Sprint 02 - Discovery Geoespacial + Swipe + Match

## Sprint Goal

Implementar el flujo end-to-end de discovery geolocalizado con swipe y creacion de match mutuo, desde API hasta UI funcional en Flutter.

## Features

- Endpoint de discovery por distancia con privacidad de ubicacion.
- Endpoint de swipe (like/dislike) con deteccion de match mutuo.
- Pantalla discovery en Flutter conectada al backend con tarjetas navegables.
- Persistencia y visualizacion basica de matches.

## Tasks

1. [x] Definir contratos API de discovery y swipe.
   - Incluir request/response DTOs versionados en `api/v1`.
   - Respuesta de discovery debe exponer distancia relativa, no lat/lng de terceros.
2. [x] Implementar `DiscoveryService` en backend.
   - Filtrar candidatos por radio configurable y excluir perfiles ya swipeados.
   - Ordenar por cercania y limitar resultados por pagina.
3. [x] Implementar `SwipeService` y endpoint de swipe.
   - Registrar like/dislike idempotente por par source-target.
   - Crear `Match` solo cuando exista aceptacion mutua.
4. [x] Exponer endpoints en API y protegerlos con JWT.
   - `GET /api/v1/discovery/candidates`
   - `POST /api/v1/discovery/swipes`
   - `GET /api/v1/discovery/matches`
5. [x] Integrar frontend Flutter con backend de discovery.
   - Reemplazar placeholders en `features/discovery` por flujo real.
   - Consumir API, mostrar tarjetas y ejecutar acciones like/dislike.
6. [x] Implementar estado y UX minima para errores y carga.
   - Empty state sin candidatos.
   - Manejo de timeout/offline con retry.
   - Feedback visual al crear match.
7. [x] Agregar pruebas automatizadas del sprint.
   - Backend: pruebas de servicio para exclusion de swipeados y creacion de match mutuo.
   - Frontend: pruebas de widget para render de tarjetas y acciones de swipe.

## Dependencies

- BL-001 completado (auth JWT).
- BL-002 completado o con datos minimos para perfiles de perro.
- Definicion operativa de proveedor multimedia no bloquea este sprint.

## Risks

- Consultas geoespaciales lentas sin estrategia de indices y paginacion.
- Inconsistencias de match ante condiciones de carrera en swipes simultaneos.
- Deuda UX si el manejo offline se posterga.

## QA Scope

- Validar que discovery no retorna perfiles ya swipeados.
- Validar que solo se crea match con like mutuo.
- Verificar que nunca se exponen coordenadas exactas de terceros.
- Verificar flujo UI de swipe y notificacion de match.

## Acceptance Criteria

- Usuario autenticado puede obtener candidatos cercanos en discovery.
- Usuario puede hacer like/dislike y el sistema persiste la decision.
- Se crea match automaticamente solo ante like reciproco.
- Frontend muestra discovery funcional conectado al backend real.
- Tests del sprint pasan en CI para backend y frontend.

## Evidence Required

- Logs de CI con tests del sprint en verde.
- Capturas del flujo discovery -> swipe -> match.
- Reporte de pruebas que confirme privacidad de ubicacion.
