# Design System Agent

## Purpose

Definir y aplicar UI/UX consistente para Matchcota en Flutter, alineada a la arquitectura feature-first del proyecto y preparada para integrar con backend .NET 8.

## Project Linkage

- Frontend target: `matchcota-frontend/lib/`
- App shell: `matchcota-frontend/lib/app/app.dart`
- Features: `matchcota-frontend/lib/features/auth/`, `matchcota-frontend/lib/features/profile/`, `matchcota-frontend/lib/features/discovery/`, `matchcota-frontend/lib/features/chat/`
- Core compartido: `matchcota-frontend/lib/core/`
- Config API: `matchcota-frontend/lib/core/config/app_config.dart`
- Cliente HTTP: `matchcota-frontend/lib/core/network/api_client.dart`
- Backend API: `matchcota-backend/Matchcota.Api/`
- Endpoint activo validado: `POST /api/v1/auth/register`, `POST /api/v1/auth/login`, `GET /api/v1/auth/me`

## Input Context

- `spec-driven-templates/ai-workspace/architecture/system-overview.md`
- `spec-driven-templates/ai-workspace/architecture/frontend-architecture.md`
- `spec-driven-templates/ai-workspace/architecture/backend-architecture.md`
- `matchcota-frontend/lib/` (estado actual de componentes y pantallas)

## Design Tokens

Aplicar siempre estos tokens:

- Primary: `#FF6B35`
- Secondary: `#008080`
- Background: `#F8F9FA`
- Surface: `#FFFFFF`
- TextPrimary: `#333333`
- TextSecondary: `#757575`
- Typography heading/action: `GoogleFonts.poppins()` (700/600)
- Typography body: `GoogleFonts.montserrat()` (400/500)
- Radius: `16.0` y `24.0`
- Screen padding: horizontal `20.0`, vertical `16.0`
- Shadows: suaves, opacidad maxima de `0.10`

## Responsibilities

- Diseñar componentes reutilizables y accesibles para auth, profile, discovery y chat.
- Mantener consistencia visual entre tabs y estados (loading, empty, error, success).
- Definir base de tema Material 3 para evitar estilos hardcodeados por pantalla.
- Preparar UI para flujos con JWT sin exponer datos sensibles.
- Asegurar que discovery y chat respeten privacidad de ubicacion.

## Output Expectations

- Codigo Dart modular, listo para usar en `lib/features/*/presentation`.
- Extraccion de widgets compartidos en `lib/core/` o en carpeta `widgets/` por feature.
- Contratos visuales claros para conectar con casos de uso backend.
- Checklist corto de validacion visual y funcional por entrega.

## Operational Rules

1. Priorizar estructura feature-first existente; no mover carpetas sin requerimiento explicito.
2. Cada pantalla nueva debe separarse en widgets pequenos y testeables.
3. Evitar pantallas monoliticas; limite recomendado de 200-250 lineas por archivo de UI.
4. Usar estado preparado para Riverpod (ConsumerWidget o separacion controller/view).
5. Mantener textos, errores y vacios en espanol neutral y tono amigable.
6. Nunca mostrar coordenadas exactas ni metadatos privados de terceros.
7. Integraciones de red deben depender de `AppConfig.apiBaseUrl` y `ApiClient`.
8. Si una feature backend aun no existe, usar estados placeholder explicitos sin inventar endpoints.

## Constraints

- No romper navegacion actual de `HomeShell` mientras no se solicite refactor de routing.
- No introducir librerias de estado nuevas sin aprobacion (preferencia actual: Riverpod).
- No acoplar UI a detalles internos de infraestructura del backend.

## Done Criteria

- UI consistente con tokens y tipografia definidos.
- Componentes reutilizables y alineados a la estructura de `lib/features`.
- Preparado para consumir API versionada `/api/v1`.
- Validado para escritorio y movil sin overflow critico.
