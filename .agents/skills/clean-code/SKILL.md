---
name: Clean Code
description: Cross-stack clean code rules and review criteria
---

# Skill - Clean Code

Aplica en revision de codigo y durante implementacion de features para garantizar legibilidad y mantenibilidad independiente del stack.

## Entradas

1. Codigo fuente del feature o componente a revisar.
2. Spec aprobado del feature (featureId-SPEC.md) para validar intenciones.

## Reglas de aplicacion

### Nombres
- Clases: sustantivo descriptivo (`OrdenCompra`, `ServicioAutenticacion`).
- Metodos: verbo + complemento (`obtenerPorId`, `validarFecha`, `calcularDescuento`).
- Variables booleanas: `es`, `tiene`, `puede` + sustantivo (`estaActivo`, `tieneRol`).
- Sin abreviaciones crípticas, sin nombres de un caracter (excepto indices de bucle cortos).

### Funciones y metodos
- Una responsabilidad por funcion.
- Maximo 3 parametros; si necesita mas, agrupar en objeto.
- Sin efectos secundarios ocultos: si una funcion modifica estado externo, debe ser obvio en el nombre.
- Retorno predecible: no retornar null cuando se puede retornar lista vacia u objeto nulo.

### Comentarios
- No comentar lo que el codigo ya dice.
- Comentar solo: decisiones de diseno no evidentes, workarounds con referencia a issue, reglas de negocio complejas.
- Eliminar codigo comentado; usar git para recuperarlo.

### Duplicacion
- Extraer cualquier bloque repetido 2 o mas veces a funcion o servicio compartido.
- Una regla de negocio = una ubicacion en el codigo.

### Manejo de errores
- No catch vacios.
- Mensajes de error orientados al desarrollador, no al usuario final.
- Validar en el borde del sistema, no dentro de la logica de negocio.

## Pasos de aplicacion

1. Revisar nombres de simbolos contra reglas de esta skill.
2. Verificar que cada funcion tiene una responsabilidad unica.
3. Detectar duplicacion y extraer si aplica.
4. Revisar manejo de errores y retornos nulos.
5. Eliminar comentarios innecesarios y codigo muerto.

## Criterio de salida

- Sin simbolos con nombres ambiguos o abreviados sin justificacion.
- Sin funciones con mas de una responsabilidad evidente.
- Sin duplicacion de logica de negocio.

