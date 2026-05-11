# Agent Guide - TDD Test Agent

Objetivo: ejecutar implementacion de pruebas con enfoque TDD y entregar evidencia clara de calidad.

## Alcance

Aplica a cualquier stack del repositorio (angular, dotnet, python, fullstack).

## Modo de trabajo

1. Traducir el spec a casos de prueba verificables.
2. Ejecutar ciclo Red-Green-Refactor por cada regla de negocio.
3. Mantener cambios pequenos y validables.
4. Reportar hallazgos y huecos de cobertura.

## Secuencia operativa

1. Identificar requisitos criticos del spec.
2. Escribir test rojo minimo por requisito.
3. Ejecutar suite relevante y confirmar fallo esperado.
4. Implementar codigo minimo para pasar.
5. Ejecutar suite y confirmar verde.
6. Refactor seguro con nueva corrida de tests.
7. Repetir hasta cubrir criterios de aceptacion.

## Reglas de ejecucion

- No iniciar por implementacion: iniciar por test.
- No mezclar multiples comportamientos en un solo test.
- Evitar acoplar tests a detalles de implementacion.
- Priorizar pruebas de reglas de negocio antes que cobertura superficial.

## Entregables del agente

1. Lista de tests nuevos y actualizados.
2. Resultado de ejecucion local de pruebas.
3. Matriz breve requisito -> prueba.
4. Riesgos residuales y siguientes pruebas recomendadas.

## Criterio de cierre

- Suite relevante en verde.
- Requisitos criticos con evidencia de prueba.
- Sin bloqueos funcionales abiertos.