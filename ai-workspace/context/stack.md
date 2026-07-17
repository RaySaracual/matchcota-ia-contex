# Stack Context

## Frontend

- Framework: Flutter
- Language: Dart
- State Management: Riverpod (preferido) o BLoC
- UI Library: Widgets nativos de Flutter + componentes feature-first
- Testing: flutter_test + pruebas de widget por feature

## Backend

- Framework: ASP.NET Core Web API (.NET 8)
- Language: C#
- ORM / Data Access: Entity Framework Core + Npgsql
- Auth: JWT Bearer
- Testing: xUnit + pruebas de integracion para endpoints criticos

## Infrastructure

- Cloud: VPS economico (DigitalOcean) o AWS EC2 t3.micro
- CI/CD: GitHub Actions
- Containerization: Docker (API + PostgreSQL/PostGIS)
- Database: PostgreSQL + PostGIS
- Cache: No definido para MVP (evaluar Redis en fase posterior)

## Conventions

- Estructura feature-first en frontend: auth, profile, discovery, chat.
- Arquitectura N-Tier simplificada en backend: Controllers -> Services -> Repositories.
- Nunca exponer coordenadas exactas de terceros; solo distancia relativa.

## Package Manager

pub (Flutter), NuGet (.NET)

## Repository Structure

```text
d:/RSSYSTEM/Matchcota/
├── spec-driven-templates/  -> Repositorio de ia-context (specs, contexto, arquitectura, sprints)
├── matchcota-backend/      -> Repositorio backend .NET (Api/Core/Infrastructure/Services)
└── matchcota-frontend/     -> Repositorio frontend Flutter
```
