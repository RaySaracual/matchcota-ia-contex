# Agent Guide - Clean Code

Objetivo: aplicar buenas practicas de codigo limpio en cualquier stack tecnologico para mejorar legibilidad, mantenibilidad y reducir deuda tecnica.

## Alcance

Aplica a cualquier lenguaje y stack. Para reglas especificas de un stack, complementar con el agente de la carpeta correspondiente.

## Reglas generales

### Nombres
- Usar nombres que revelen intencion: `calcularSaldoPendiente()` en lugar de `calc()`.
- No usar abreviaciones crípticas; usar nombres completos y en idioma uniforme del proyecto.
- Clases: sustantivo o sustantivo + adjetivo (`OrdenServicio`, `CalculadoraImpuesto`).
- Funciones/metodos: verbo + complemento (`obtenerUsuarioPorId`, `validarFecha`).
- Variables booleanas: prefijo `es`, `tiene`, `puede` (`estaActivo`, `tienePermiso`).

### Funciones
- Una funcion, una responsabilidad.
- Maximo 20 lineas por funcion como guia; si supera eso, evaluar extraccion.
- Sin efectos secundarios ocultos.
- Parametros maximos recomendados: 3. Si necesita mas, usar objeto de parametros.

### Comentarios
- El codigo debe ser autoexplicativo; comentar el "por que", no el "que".
- Eliminar codigo comentado; usar control de versiones para recuperarlo.
- TODO permitidos solo si tienen fecha y responsable: `// TODO 2026-05 Ray_S: revisar cuando se migre a API v2`.

### Duplicacion
- Seguir DRY (Don't Repeat Yourself): extraer logica duplicada a funciones o servicios compartidos.
- Una fuente de verdad por regla de negocio.

### Manejo de errores
- No silenciar excepciones con bloques catch vacios.
- Mensajes de error utiles para el desarrollador (no exponer stack traces al usuario).
- Validar entradas en los limites del sistema (formularios, APIs, servicios externos).

### Estructura
- Un archivo, una responsabilidad principal.
- Separar claramente logica de negocio, acceso a datos y presentacion.
- No mezclar queries de base de datos con logica de negocio ni con presentacion.

## Secuencia operativa para revision

1. Revisar nombres de clases, funciones y variables contra reglas anteriores.
2. Verificar que funciones no superen responsabilidad unica.
3. Buscar duplicacion; extraer si aplica.
4. Revisar manejo de errores.
5. Verificar que no hay codigo muerto ni comentado sin justificacion.

## Criterio de aceptacion

- Cualquier desarrollador nuevo puede leer el codigo y entender su proposito sin documentacion adicional.
- No existen metodos con mas de una responsabilidad evidente.
- No existe logica duplicada sin justificacion.
