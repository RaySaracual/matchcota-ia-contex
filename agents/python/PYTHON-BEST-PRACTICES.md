# Agent Guide - Python Best Practices

Objetivo: guiar la implementacion de features en proyectos Python garantizando estructura clara, tipado, contratos de API y controles de seguridad.

## Alcance

Aplica al stack `python`. Complementar con CLEAN-CODE.md y SECURITY-OWASP.md.

## Estructura del proyecto

- Separar capas: rutas/endpoints → servicios → repositorios/acceso a datos.
- Usar paquetes (carpetas con `__init__.py`) por dominio funcional, no por tipo de archivo.
- Dependencias declaradas en `requirements.txt` o `pyproject.toml`; nunca instaladas manualmente sin registrar.
- Variables de entorno via `python-dotenv` o equivalente; no hardcodeadas.

## Tipado

- Usar type hints en todas las funciones publicas: parametros y retorno.
- Usar `dataclasses` o `pydantic` para modelos de datos.
- Evitar `Any` sin justificacion; si se usa, documentar por que.

## Funciones y clases

- Una funcion, una responsabilidad.
- Funciones con mas de 3 parametros: usar dataclass o dict tipado como argumento.
- Clases solo cuando el estado es necesario; funciones puras preferidas para logica stateless.

## API y contratos

- Validar esquemas de request y response con pydantic o equivalente.
- Retornar errores con estructura consistente (`{ "code": ..., "message": ... }`).
- Sin stack traces en respuestas de API; log interno + mensaje generico al cliente.

## Manejo de errores

- Excepciones especificas, no capturar `Exception` a secas sin re-lanzar.
- Loguear errores con contexto suficiente para diagnosticar (sin datos sensibles).
- Validar entradas al inicio de la funcion o en el borde del endpoint.

## Pruebas

- Usar `pytest`; un archivo de test por modulo de negocio.
- Fixtures para datos comunes; no repetir setup en cada test.
- Testear logica de negocio directamente en servicios, sin levantar servidor completo.

## Secuencia operativa

1. Revisar estructura de carpetas y separacion de capas.
2. Verificar type hints en funciones publicas.
3. Aplicar CLEAN-CODE: nombres, responsabilidad unica.
4. Aplicar SECURITY-OWASP: validacion de inputs, secretos, autorizacion.
5. Verificar manejo de excepciones y respuestas de error.
6. Revisar pruebas existentes o crear las faltantes.

## Criterio de aceptacion

- Type hints en todas las funciones publicas.
- Sin hardcoded secrets ni credenciales.
- Validacion de entrada en borde del endpoint.
- Sin stack traces expuestos en respuestas HTTP.
