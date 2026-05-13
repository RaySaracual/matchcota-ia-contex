---
name: Code Review
description: Spec-traceable code review checklist
---

# Skill - Code Review

Aplica durante la revision de pull requests y cambios de codigo para garantizar calidad, trazabilidad al spec y cumplimiento de controles antes de integrar.

## Entradas

1. Diff o conjunto de cambios del pull request.
2. Spec del feature (featureId-SPEC.md) con criterios de aceptacion.
3. Skills aplicados en el feature: CLEAN-CODE, SECURITY-OWASP y los especificos del stack.

## Pasos

1. Verificar que los cambios tienen un featureId trazable al spec.
2. Revisar que los criterios de aceptacion del spec estan cubiertos.
3. Aplicar CLEAN-CODE: nombres, responsabilidad unica, sin duplicacion.
4. Aplicar SECURITY-OWASP: sin inyecciones, sin secretos, autorizacion presente.
5. Verificar contrato: si cambia API o schema, la documentacion del contrato debe estar actualizada.
6. Revisar pruebas: cambios deben ir acompanados de pruebas o ajuste de pruebas existentes.
7. Verificar que no hay breaking changes no comunicados.

## Criterio de salida

- Checklist completo sin items criticos abiertos.
- Trazabilidad al spec confirmada.
- Sin secretos ni inyecciones posibles en los cambios revisados.

