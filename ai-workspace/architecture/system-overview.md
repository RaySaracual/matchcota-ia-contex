# System Overview - Matchcota MVP

## Overview

Matchcota es una plataforma cliente-servidor de tres capas para discovery canino geolocalizado, match mutuo y chat en tiempo real.

## Architectural Style

- Frontend mobile en Flutter.
- Backend REST en ASP.NET Core Web API (.NET 8).
- Datos relacionales y geoespaciales en PostgreSQL + PostGIS.
- Almacenamiento multimedia externo (S3 o Firebase Storage).

## Core Modules

- Auth: registro/login y emision de JWT.
- Profile: gestion de usuario, perros y media.
- Discovery: candidatos cercanos con filtros y exclusiones.
- Match: creacion de match tras swipe mutuo.
- Chat: mensajeria en tiempo real entre usuarios con match.

## Data Flow

1. Usuario se autentica y obtiene JWT.
2. App solicita discovery con ubicacion actual.
3. Backend consulta PostGIS, filtra swipes previos y devuelve tarjetas.
4. Swipe positivo/negativo se persiste.
5. Si hay positivo mutuo, se crea Match y habilita chat.

## Communication Strategy

- HTTP/JSON para API funcional.
- Canal en tiempo real (SignalR recomendado) para chat.
- Eventos de dominio internos para transiciones de swipe->match.

## Deployment Strategy

- Contenedores Docker para API y DB.
- CI/CD con GitHub Actions.
- Entorno inicial en VPS economico o EC2 pequena.

## Scalability Strategy

- Indice espacial GIST obligatorio en Dogs.location.
- Paginacion en listas de chat y matches.
- Evolucion a cache/colas solo cuando el trafico lo requiera.

## Risks

- Consultas geoespaciales lentas sin tuning de indices.
- Riesgo de exposicion accidental de ubicacion exacta.
- Complejidad de sincronizacion en tiempo real de chat.

## Technical Constraints

- Stack fijo para MVP: Flutter + .NET 8 + PostgreSQL/PostGIS.
- Priorizacion de costo bajo sobre alta disponibilidad enterprise.
