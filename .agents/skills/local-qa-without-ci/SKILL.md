---
name: Local QA Without CI
description: Local QA execution flow without CI pipeline
---

# Skill - Local QA Without CI

Aplica cuando un proyecto no tiene pipeline CI y requiere control de calidad local basado en Spec-Driven.

## Entradas

1. Spec aprobado por `validate_spec_gate`.
2. Estructura intake del feature.

## Pasos

1. Leer `intake/<featureId>/specs/<featureId>-SPEC.md`.
2. Generar casos con `qa_generate_from_spec`.
3. Ejecutar comandos definidos en `.spec-driven/local-qa.json`.
4. Registrar resultados por caso en `test-cases/TC-<featureId>.md`.
5. Publicar reporte con `qa_publish_evidence`.

## Criterio de salida

- Evidencia generada y trazable dentro de `intake/<featureId>/evidence`.

