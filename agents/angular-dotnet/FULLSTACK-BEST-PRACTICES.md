# Agent Guide - Angular + .NET Full-Stack Best Practices

Objetivo: guiar la implementacion de features en proyectos con frontend Angular y backend .NET, garantizando contratos consistentes entre capas y coherencia en el flujo de datos de extremo a extremo.

## Alcance

Aplica al stack `angular-dotnet`. Complementar con ANGULAR-BEST-PRACTICES.md, DOTNET-BEST-PRACTICES.md, CLEAN-CODE.md y SECURITY-OWASP.md.

## Contrato entre frontend y backend

- El contrato de la API (OpenAPI o DTO compartido) es la fuente de verdad entre ambas capas.
- Cualquier cambio en el DTO de respuesta debe reflejarse en la interfaz TypeScript del frontend antes de mergear.
- Versionar endpoints cuando hay breaking changes (`/api/v2/...`).
- Nunca asumir estructura de respuesta en el frontend; siempre tipar contra la interfaz del contrato.

## Flujo de datos end-to-end

Frontend (Component) → Service (HttpClient) → API (.NET Controller) → Service → Repository → BD

- El componente Angular no llama a HTTP directamente.
- El controller .NET no contiene logica de negocio.
- La validacion ocurre en ambos lados: frontend para UX, backend como control definitivo.

## Autenticacion y autorizacion

- Token JWT gestionado en el servicio de autenticacion Angular; no almacenar en localStorage si el riesgo XSS es alto (preferir httpOnly cookie o memoria con refresh token).
- Backend valida el token en cada request; el frontend no es autoridad de autorizacion.
- Guards de Angular para UX; `[Authorize]` en backend para seguridad real.

## Manejo de errores

- Backend retorna errores con estructura consistente (`{ code, message }`); nunca stack traces.
- Frontend tiene un interceptor HTTP que captura errores y los presenta de forma uniforme.
- Los errores de validacion del backend se mapean al formulario correspondiente en el frontend.

## Secuencia operativa por feature full-stack

1. Definir contrato (request/response DTO) antes de implementar backend ni frontend.
2. Implementar y probar endpoint backend con contrato definido.
3. Generar o actualizar interfaz TypeScript del frontend contra el contrato.
4. Implementar servicio y componente Angular contra la interfaz tipada.
5. Aplicar CLEAN-CODE y SECURITY-OWASP en ambas capas.
6. Ejecutar QA local: build backend + build frontend + pruebas.

## Criterio de aceptacion

- Contrato definido antes de implementar.
- Interfaces TypeScript tipadas contra el contrato del backend.
- Validacion en frontend (UX) y en backend (seguridad).
- Sin stack traces expuestos al cliente.
- Guards Angular y `[Authorize]` alineados en los mismos roles/permisos.
