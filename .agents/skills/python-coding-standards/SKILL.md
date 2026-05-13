---
name: Python Coding Standards
description: Python coding, typing, and testing standards
---

# Skill - Python Coding Standards

Aplica durante implementacion y revision de codigo Python para garantizar consistencia, tipado y contratos claros.

## Entradas

1. Modulo, servicio o endpoint a revisar o implementar.
2. Spec del feature para validar que la responsabilidad esta en la capa correcta.

## Reglas de aplicacion

### Nomenclatura (PEP 8)
- Modulos y paquetes: snake_case (`usuario_service.py`, `factura_repository.py`).
- Clases: PascalCase (`UsuarioService`, `FacturaRepository`).
- Funciones, metodos y variables: snake_case (`obtener_por_id`, `calcular_descuento`).
- Constantes de modulo: UPPER_SNAKE_CASE (`MAX_INTENTOS`, `URL_BASE`).

### Type hints
- Todas las funciones publicas deben tener hints de parametros y retorno.
- Usar `Optional[T]` o `T | None` en lugar de omitir el tipo cuando puede ser None.
- Usar `list[T]`, `dict[K, V]` (Python 3.9+) en lugar de `List`, `Dict` de typing cuando es posible.

### Modelos de datos
- Pydantic `BaseModel` para request/response de API.
- `dataclass` para modelos internos sin validacion compleja.
- Sin dicts sin tipar pasando entre capas.

### Funciones
- Sin parametros con tipo `Any` sin comentario justificativo.
- Retorno explicito en funciones que pueden retornar `None`.
- Funciones de mas de 20 lineas: evaluar extraccion.

### Imports
- Imports en orden: stdlib → terceros → proyecto.
- Sin imports con `*` (`from modulo import *`).
- Sin imports circulares; reestructurar si aparecen.

### Pruebas
- Nombre del test: `test_<accion>_<condicion>_<resultado_esperado>`.
- Un assert conceptual por test (puede haber varios assert si son del mismo resultado).
- Fixtures para datos repetidos entre tests.

## Pasos de aplicacion

1. Verificar nomenclatura PEP 8.
2. Revisar type hints en funciones publicas.
3. Verificar modelos pydantic o dataclass para datos entre capas.
4. Revisar imports ordenados y sin circulares.
5. Verificar que tests siguen convencion de nombre y son independientes.

## Criterio de salida

- Nomenclatura PEP 8 consistente.
- Type hints en todas las funciones publicas.
- Sin dicts sin tipar pasando entre capas de la aplicacion.
- Tests con nombres descriptivos.

