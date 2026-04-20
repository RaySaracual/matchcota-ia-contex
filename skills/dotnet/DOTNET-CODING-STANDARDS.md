# Skill - .NET Coding Standards

Aplica durante implementacion y revision de codigo en proyectos .NET para garantizar consistencia, capas bien definidas y contratos claros.

## Entradas

1. Clase, servicio o endpoint a revisar o implementar.
2. Spec del feature para validar que la capa de implementacion es correcta.

## Reglas de aplicacion

### Nomenclatura
- Clases, metodos publicos y propiedades: PascalCase.
- Variables locales y parametros: camelCase.
- Interfaces: prefijo `I` + PascalCase (`IUsuarioService`).
- Constantes: PascalCase o UPPER_SNAKE_CASE segun convencion del proyecto.
- Archivos: un archivo por clase publica; nombre igual a la clase.

### Controllers
- Solo: recibir request, llamar servicio, retornar respuesta.
- Sin logica de negocio. Sin acceso directo a base de datos.
- Inyectar servicio por interfaz; no instanciar con `new`.

### Servicios
- Sin referencias a `HttpContext` ni conceptos HTTP.
- Lanzar excepciones de dominio (`ArgumentException`, `InvalidOperationException` o excepciones propias) cuando detecta inconsistencia.
- Sin retorno de `null` donde se puede retornar `Optional` o lista vacia.

### DTOs
- Atributos de validacion en el DTO de entrada (`[Required]`, `[MaxLength]`, `[Range]`).
- DTO de salida no expone propiedades de la entidad que no corresponde al cliente.
- Separar DTO de request y response aunque tengan campos similares.

### Acceso a datos
- Queries siempre parametrizadas.
- Repository retorna entidades del dominio; no retorna tipos del ORM a capas superiores.
- Usar `using` o `await using` para conexiones y transacciones.

## Pasos de aplicacion

1. Verificar nomenclatura de clases, metodos y variables.
2. Revisar que la logica esta en la capa correcta (controller vs servicio).
3. Verificar DTOs con validacion de entrada.
4. Revisar queries parametrizadas.
5. Verificar que interfaces se usan para todas las dependencias entre capas.

## Criterio de salida

- Nomenclatura consistente con estandar .NET del proyecto.
- Sin logica de negocio en controllers.
- Todas las queries parametrizadas.
- DTOs de entrada con validaciones.
