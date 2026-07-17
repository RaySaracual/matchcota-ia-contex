# Sprint 01 - Fundaciones MVP

## Sprint Goal

Construir la base tecnica del producto para habilitar implementacion segura de discovery y chat.

## Features

- Setup backend .NET 8 en capas.
- Setup app Flutter feature-first.
- Contratos iniciales de auth/profile/discovery.
- Pipeline CI/CD base.

## Tasks

1. [x] Crear solucion backend con proyectos Api/Core/Infrastructure/Services. (Completada: 2026-07-17)
   - Nota: codigo movido a repositorio separado en d:/RSSYSTEM/Matchcota/matchcota-backend.
2. [x] Configurar DbContext y esquema inicial con tablas de dominio. (Completada: 2026-07-17)
   - Evidencia: MatchcotaDbContext + migracion InitialCreate en matchcota-backend/Matchcota.Infrastructure/Persistence/Migrations.
3. [x] Definir endpoint de auth y middleware JWT. (Completada: 2026-07-17)
   - Evidencia: api/v1/auth/register, api/v1/auth/login y api/v1/auth/me con JWT Bearer habilitado.
4. [x] Crear esqueleto Flutter con modulos auth/profile/discovery/chat. (Completada: 2026-07-17)
   - Evidencia: repositorio separado d:/RSSYSTEM/Matchcota/matchcota-frontend con estructura feature-first y test base en verde.
5. [x] Definir clientes HTTP y manejo de sesion. (Completada: 2026-07-17)
   - Evidencia: ApiClient con interceptor Bearer JWT, SessionStore seguro y AuthPage conectada a register/login/logout.
6. [x] Configurar GitHub Actions para build y tests minimos. (Completada: 2026-07-17)
   - Evidencia: workflows CI en matchcota-backend/.github/workflows/ci.yml y matchcota-frontend/.github/workflows/ci.yml.

## Dependencies

- Spec aprobado en ai-workspace/specs/init-spec.md.
- Definicion de proveedor multimedia (S3 o Firebase).

## Risks

- Deuda tecnica por no definir desde inicio politicas de privacidad de ubicacion.
- Retraso por decisiones de proveedor cloud pendientes.

## QA Scope

- Build backend y frontend exitosos.
- Pruebas iniciales de auth y validacion de contratos.
- Verificacion de no exposicion de coordenadas exactas en responses.

## Acceptance Criteria

- Solucion backend compila y expone endpoints base con JWT.
- App Flutter inicia con navegacion base por features.
- Pipeline CI ejecuta build y pruebas basicas en PR.

## Evidence Required

- Logs de pipeline exitoso.
- Capturas o reportes de pruebas iniciales.
- Checklist de seguridad inicial completado.
