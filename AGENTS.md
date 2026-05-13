# Spec-Driven Development - Instrucciones de Agente

Este repositorio contiene plantillas y reglas Spec-Driven para uso generico en editores e IDEs.

## Politica obligatoria

- Todo requerimiento nuevo requiere spec aprobado antes de iniciar desarrollo.
- Sin spec aprobado (`validate_spec_gate ok=true`), el desarrollo esta bloqueado.
- El spec es la unica fuente de verdad para criterios de aceptacion, contratos y trazabilidad.

## Politica de mantenimiento

- Fuente unica de verdad para skills: `.agents/skills/**/SKILL.md`.
- Fuente unica de verdad para template base SDD: `templates/base/FEATURE-SPEC-BASE.md`.
- No duplicar reglas ni templates en carpetas por herramienta.

## Flujo Spec-Driven por feature

1. Crear spec en `intake/<featureId>/specs/<featureId>-SPEC.md` usando `templates/base/FEATURE-SPEC-BASE.md`.
2. Validar spec con `validate_spec_gate`.
3. Implementar contra criterios de aceptacion del spec.
4. Generar casos QA con `qa_generate_from_spec`.
5. Ejecutar QA local y publicar evidencia con `qa_publish_evidence`.
6. Hacer code review trazado al spec antes de mergear.

## Skills por stack

- Angular: `.agents/skills/angular-coding-standards/SKILL.md`
- Angular + .NET: `.agents/skills/angular-dotnet-fullstack-coding-standards/SKILL.md`
- .NET: `.agents/skills/dotnet-coding-standards/SKILL.md`
- Python: `.agents/skills/python-coding-standards/SKILL.md`
- UI/UX: `.agents/skills/ui-ux-standards/SKILL.md`
- Genericas: `.agents/skills/clean-code/SKILL.md`, `.agents/skills/code-review/SKILL.md`, `.agents/skills/security-owasp/SKILL.md`, `.agents/skills/tdd-test-implementation/SKILL.md`, `.agents/skills/local-qa-without-ci/SKILL.md`, `.agents/skills/caveman-token-saver-lite/SKILL.md`
