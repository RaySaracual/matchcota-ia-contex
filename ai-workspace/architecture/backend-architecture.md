# Backend Architecture - Matchcota MVP

## Overview

API REST en ASP.NET Core .NET 8 con arquitectura N-Tier simplificada.

## Layered Structure

- Matchcota.Api: controllers, middleware, auth y swagger.
- Matchcota.Services: casos de uso y reglas de negocio.
- Matchcota.Core: entidades, contratos e invariantes de dominio.
- Matchcota.Infrastructure: DbContext, repositorios e integraciones de almacenamiento.

## Domain Entities

- User
- Dog
- DogMedia
- Swipe
- Match
- Message

## Critical Workflows

- Discovery: ST_DWithin sobre Dogs.location + exclusion de swipes previos.
- Matching: creacion de Match solo en aceptacion mutua.
- Messaging: envio de mensaje solo cuando existe Match activo.

## Data Access

- EF Core + Npgsql.
- Indice GIST en location para consultas geoespaciales.
- Transacciones para operaciones consistentes de swipes/matches.

## API Design

- Endpoints versionados /api/v1.
- ProblemDetails para errores.
- DTOs para entrada/salida.

## Observability

- Logs estructurados por request y modulo.
- Correlation ID por peticion.

## Testing Strategy

- Unit tests de servicios criticos.
- Integration tests de endpoints auth/discovery/match/chat.
