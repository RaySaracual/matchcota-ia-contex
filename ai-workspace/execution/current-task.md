# Current Task

## Active Task

Start Sprint 1

## Objective

Levantar la base tecnica del MVP para habilitar autenticacion, discovery geoespacial y pipeline CI/CD.

## Scope

**In scope:**

- Setup de soluciones backend .NET 8 por capas.
- Setup base de app Flutter por features.
- Modelo de datos inicial y migraciones base con PostGIS.
- Pipeline CI/CD inicial en GitHub Actions.

**Out of scope:**

- Funcionalidades avanzadas de moderacion.
- Escalado horizontal y optimizaciones de alto volumen.

## Related Spec

ai-workspace/specs/init-spec.md

## Active Risks

- Complejidad de consultas geoespaciales sin indice GIST correcto.
- Riesgo de fugas de privacidad de ubicacion por DTOs mal diseniados.

## Progress

- Inicializacion de contexto, arquitectura y sprint completada.
- Tarea 1 de Sprint 01 completada: solucion backend .NET creada con proyectos Api/Core/Infrastructure/Services y build exitoso.
- Tarea 2 de Sprint 01 completada: DbContext de dominio y esquema inicial Code First con migracion InitialCreate.
- Tarea 3 de Sprint 01 completada: endpoints de auth (register/login/me) y middleware JWT Bearer habilitado.
- Reorganizacion aplicada: backend movido a d:/RSSYSTEM/Matchcota/matchcota-backend y frontend reservado en d:/RSSYSTEM/Matchcota/matchcota-frontend.
- Tarea 4 de Sprint 01 completada: app Flutter base creada en repositorio separado con modulos auth/profile/discovery/chat y pruebas iniciales en verde.
- Tarea 5 de Sprint 01 completada: cliente HTTP y manejo de sesion JWT implementados en frontend para auth.
- Tarea 6 de Sprint 01 completada: pipelines GitHub Actions para backend y frontend con build/tests minimos.

## Next Steps

1. Iniciar Sprint 02 con implementacion de discovery geoespacial (BL-003).

## Last Updated

2026-07-17
