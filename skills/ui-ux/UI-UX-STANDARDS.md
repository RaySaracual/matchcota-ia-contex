# Skill - UI/UX Standards

Aplica durante el diseno e implementacion de interfaces de usuario para garantizar consistencia visual, accesibilidad, usabilidad y una experiencia coherente con el sistema.

## Entradas

1. Spec del feature con descripcion del flujo funcional y usuarios afectados.
2. Pantalla, componente o flujo a disenar o revisar.

## Principios base

### Consistencia
- Usar componentes y patrones ya existentes en el sistema antes de crear nuevos.
- Mismos colores, tipografias y espaciados del design system o guia de estilos del proyecto.
- Acciones equivalentes (guardar, cancelar, eliminar) con el mismo patron de interaccion en todas las pantallas.

### Jerarquia visual
- La accion primaria del flujo siempre es visualmente la mas prominente.
- Maximo una accion primaria por pantalla o seccion.
- Informacion critica arriba; detalles secundarios abajo o en secciones colapsables.

### Feedback al usuario
- Toda accion debe tener respuesta visible: estado de carga, exito o error.
- Mensajes de error orientados a la accion correctiva: no "Error 500", sino "No se pudo guardar. Intenta de nuevo."
- Confirmaciones solo para acciones destructivas o irreversibles.

### Formularios
- Etiquetas siempre visibles (no solo placeholder).
- Mensajes de validacion junto al campo afectado, no solo al final del formulario.
- Orden de campos segun flujo natural del usuario, no segun estructura de la base de datos.
- Deshabilitar boton de envio mientras se procesa para evitar doble envio.

### Accesibilidad minima
- Contraste de texto minimo 4.5:1 (WCAG AA) para texto normal.
- Navegacion por teclado funcional en flujos criticos.
- Etiquetas `aria-label` o `<label for>` en campos de formulario.
- Imagenes con `alt` descriptivo; imagenes decorativas con `alt=""`.

### Responsive
- Flujos criticos funcionales en viewport movil (min 375px) y escritorio.
- Tablas con scroll horizontal o layout alternativo en movil, no truncamiento de datos.

### Estados de interfaz
- Definir y disenar todos los estados del feature: vacio, cargando, con datos, error, sin permisos.
- Estado vacio: no dejar pantalla en blanco; mensaje descriptivo + accion sugerida si aplica.

## Pasos de aplicacion

1. Verificar que el feature usa componentes y patrones existentes del sistema.
2. Revisar jerarquia visual: accion primaria identificable, informacion critica visible.
3. Verificar feedback en estados de carga, exito y error.
4. Revisar formularios: etiquetas, validaciones junto al campo, orden natural.
5. Verificar accesibilidad basica: contraste, navegacion por teclado, atributos aria.
6. Revisar comportamiento en movil y escritorio.

## Criterio de salida

- Todos los estados del feature definidos e implementados.
- Mensajes de error orientados a accion correctiva.
- Accesibilidad WCAG AA en contraste y etiquetado de formularios.
- Comportamiento funcional en viewport movil minimo (375px).
