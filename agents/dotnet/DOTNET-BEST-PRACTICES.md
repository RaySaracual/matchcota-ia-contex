# Agent Guide - .NET Best Practices

Objetivo: guiar la implementacion de features en proyectos .NET (ASP.NET Core o .NET Framework) aplicando arquitectura por capas, contratos claros y controles de seguridad.

## Alcance

Aplica a stacks `dotnet` y `aspx-dotnetframework`. Complementar con CLEAN-CODE.md y SECURITY-OWASP.md.

## Arquitectura por capas

- Presentacion (Controller/Endpoint) → Aplicacion (Service) → Dominio → Infraestructura (Repository).
- Dependencias apuntan hacia el dominio; el dominio no depende de infraestructura.
- Usar interfaces para servicios y repositorios; inyectar por contrato, no por implementacion concreta.

## Controllers y Endpoints

- Controllers delgados: solo validacion HTTP, llamada al servicio y retorno de respuesta.
- Sin logica de negocio en controllers.
- Retornar `ActionResult<T>` tipado; no `object` ni `dynamic`.
- Usar `[ProducesResponseType]` para documentar posibles respuestas.

## Servicios

- Logica de negocio exclusivamente en la capa de servicio.
- Un servicio por dominio funcional (`IUsuarioService`, `IFacturaService`).
- Manejo de excepciones: capturar excepciones de infraestructura y relanzar como excepciones de dominio.

## DTOs y contratos

- DTOs separados de las entidades del dominio.
- Validacion de DTOs con DataAnnotations o FluentValidation en el borde del sistema.
- Sin exponer entidades de base de datos directamente en respuestas de API.

## Acceso a datos

- Usar parametros en queries SQL; nunca concatenar input del usuario.
- Repository pattern para abstraer el ORM o el acceso directo a base de datos.
- Transacciones explicitas cuando una operacion modifica multiples tablas.

## Seguridad

- Autorizacion con `[Authorize]` y politicas de rol en cada endpoint que lo requiera.
- Nunca retornar stack traces al cliente; log interno + mensaje de error generico al usuario.
- Secretos de conexion via configuracion del entorno (`appsettings.{env}.json` + variables de entorno), nunca hardcodeados.

## Secuencia operativa

1. Revisar que la responsabilidad del feature cabe en la capa correcta.
2. Verificar DTOs con validacion en el borde.
3. Aplicar CLEAN-CODE a nombres de clases, metodos y variables.
4. Aplicar SECURITY-OWASP: autorizacion, parametrizacion SQL, secretos.
5. Revisar que la respuesta de error no expone detalles internos.

## Criterio de aceptacion

- Sin logica de negocio en controllers.
- Sin queries con concatenacion de input del usuario.
- Sin stack traces expuestos al cliente.
- Interfaces usadas para dependencias entre capas.
