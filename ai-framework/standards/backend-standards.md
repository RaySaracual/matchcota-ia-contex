# Backend Standards

> Adjusted from base - derived from ai/specs/init-spec.md

## Principles

- N-Tier simplificada y cohesion por modulo.
- Reglas de negocio centralizadas en Services.
- Seguridad y privacidad por defecto.
- Consultas geoespaciales eficientes.
- Observabilidad minima desde MVP.

---

## Rules

- Mantener capas Controllers -> Services -> Repositories.
- Evitar logica de negocio en controllers y en repositorios.
- Implementar consultas discovery con PostGIS ST_DWithin y filtro de swipes previos.
- Crear indice GIST en Dogs.location como requisito no negociable.
- Configurar DI por interfaces en Core/Infrastructure/Services.
- Asegurar transacciones atomicas para operaciones de swipe->match.
- Usar cancellation tokens en operaciones I/O de API.
- Registrar logs estructurados para auth, discovery, match y errores.
