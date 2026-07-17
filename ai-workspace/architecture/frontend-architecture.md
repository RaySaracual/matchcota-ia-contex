# Frontend Architecture - Matchcota MVP

## Overview

Aplicacion movil Flutter con estructura feature-first y navegacion declarativa.

## Structure

- lib/core/: theme, network, config y utilidades transversales.
- lib/features/auth/: login y registro.
- lib/features/profile/: CRUD de perfil canino y media.
- lib/features/discovery/: tarjetas swipe y ranking de candidatos.
- lib/features/chat/: lista de matches y conversaciones.

## State Management

- Riverpod como opcion por defecto para escalabilidad.
- Providers por feature para estado y orchestration.
- Widgets orientados a presentacion y accesibilidad.

## Navigation

- GoRouter para rutas declarativas y manejo de deep links.

## Error Handling

- Estado de error consistente en providers.
- Mensajes de error amigables y no filtrado de detalles internos.

## Security and Privacy

- JWT almacenado en almacenamiento seguro.
- Nunca renderizar coordenadas exactas de terceros.
- Solicitar permisos de ubicacion con consentimiento explicito.

## Testing Strategy

- Widget tests para auth, discovery y chat.
- Unit tests para controladores/proveedores criticos.
