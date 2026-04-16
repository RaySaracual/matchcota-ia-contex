# Agent Guide - Bootstrap Day-0

Objetivo: inicializar cualquier proyecto sin IA previa para trabajar con Spec-Driven desde el primer requerimiento.

## Secuencia operativa

1. Ejecutar `detect_project_profile`.
2. Ejecutar `bootstrap_project_day0`.
3. Ejecutar `configure_local_qa`.
4. Si existe documento PDF/DOCX, ejecutar `init_spec_from_document`.
5. Si no existe documento, ejecutar `init_spec_from_bitbucket`.
6. Ejecutar `validate_spec_gate` hasta obtener `ok=true`.
7. Ejecutar `qa_generate_from_spec`.
8. Ejecutar `qa_publish_evidence` para registrar corrida local.

## Regla de entrada obligatoria

- Si hay insumo documental, siempre priorizar `init_spec_from_document`.

## Evidencia minima

- `intake/<featureId>/specs/<featureId>-SPEC.md`
- `intake/<featureId>/test-cases/TC-<featureId>.md`
- `intake/<featureId>/evidence/<featureId>-QA-LOCAL-PLAN.md`
- `intake/<featureId>/evidence/<featureId>-QA-EXECUTION-<fecha>.md`
