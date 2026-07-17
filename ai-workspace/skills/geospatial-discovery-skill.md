# Geospatial Discovery Skill

## Purpose

Estandarizar la implementacion del flujo de discovery geoespacial.

## Context Requirements

- Esquema de datos con Dogs.location geoespacial.
- Usuario autenticado con ubicacion valida.
- Historial de swipes accesible para exclusiones.

## Preconditions

- PostGIS habilitado en la base.
- Indice GIST creado en Dogs.location.
- Radio de busqueda definido por requerimiento.

## Execution Steps

1. Validar input de ubicacion y radio permitido.
2. Consultar candidatos con ST_DWithin.
3. Excluir perros ya swipeados por el usuario.
4. Ordenar por distancia ascendente y aplicar paginacion.
5. Devolver DTO con distancia relativa y datos permitidos.

## Expected Output

- Lista paginada de candidatos aptos para swipe.

## Validation Rules

- Ningun resultado debe incluir lat/lng exacta de terceros.
- Candidatos ya swipeados no deben reaparecer.
- Consulta debe usar indice espacial en plan de ejecucion.

## Failure Conditions

- Input de ubicacion invalido.
- PostGIS no disponible o consulta degradada.
- Filtro de exclusiones inconsistente.

## Related Standards

- ai-framework/standards/backend-standards.md
- ai-framework/standards/security-standards.md
