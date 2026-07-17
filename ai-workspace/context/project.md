# Project Context

## Project Name

Matchcota (MVP)

## Description

Aplicacion movil para conectar duenos de perros mediante descubrimiento geolocalizado, swipes y mensajeria en tiempo real despues de un match mutuo.

## Domain

Social networking geolocalizado para mascotas.

## Business Objectives

- Validar traccion del producto con un MVP funcional en mobile.
- Habilitar descubrimiento cercano de perfiles caninos con baja latencia.
- Incrementar engagement con match + chat en tiempo real.
- Proteger privacidad de ubicacion mostrando distancia relativa, no coordenadas exactas.

## Constraints

- Frontend obligatorio en Flutter.
- Backend obligatorio en .NET 8 con API REST.
- Base de datos PostgreSQL con PostGIS para consultas geoespaciales.
- Costo de infraestructura inicial bajo (despliegue en VPS/EC2 pequeno).
- Todo trafico sobre HTTPS y rutas protegidas con JWT salvo login/registro.

## Key Actors

- Dueno de perro (usuario final).
- Administrador tecnico/operacion (monitorea disponibilidad y despliegues).

## Glossary

- Swipe: Gesto de aceptar/rechazar un perfil canino en discovery.
- Match: Aceptacion mutua entre dos perfiles que habilita chat.
- Discovery: Flujo para explorar perfiles cercanos segun geolocalizacion.
- Distancia relativa: Distancia aproximada mostrada al usuario, sin exponer coordenadas.
- DogMedia: Fotos o videos asociados a un perfil canino.

## Out of Scope

- Marketplace, pagos o suscripciones en MVP.
- Panel administrativo avanzado de moderacion.
- Version web completa (MVP enfocado en app movil).
