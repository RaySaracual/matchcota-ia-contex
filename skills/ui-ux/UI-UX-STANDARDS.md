# Skill - UI/UX Modern Angular Standards

Objetivo: disenar e implementar UIs modernas en Angular usando templates actuales, accesibilidad AA y patrones consistentes de producto.

## Cuando usar este skill

- Nuevas pantallas o flujos en Angular.
- Refactor visual de componentes existentes.
- Revisiones de PR con impacto en template, estilos o usabilidad.

## Entradas minimas

1. Spec funcional del feature.
2. Usuario objetivo y tarea principal.
3. Restricciones de UI (design system, librerias, tema).
4. Estados requeridos: cargando, error, vacio, con datos, sin permisos.

## Reglas Angular para UI moderna

### Arquitectura de componente
- Preferir componentes standalone.
- Usar OnPush por defecto en componentes de UI.
- Separar contenedor (estado/orquestacion) de presentacional (render y eventos).
- Evitar logica compleja en el template; mover a propiedades computadas.

### Template moderno (Angular 17+)
- Usar control flow nuevo: @if, @for, @switch.
- En listas, usar track estable en @for para evitar rerenders innecesarios.
- Usar @defer en bloques pesados o secundarios para mejorar carga inicial.
- Evitar anidamiento profundo de condiciones; simplificar con view-model.

### Estado y reactividad
- Preferir signals y computed para estado local de UI.
- Efectos solo para sincronizacion con servicios externos.
- Usar async pipe o lectura de signals; evitar subscribe manual en componente de UI.

### Formularios
- Reactive Forms para validacion real de negocio.
- Labels visibles siempre, nunca solo placeholder.
- Validacion en contexto junto al campo.
- Mensajes de error accionables y especificos.

### Diseno visual moderno
- Jerarquia clara: una accion primaria por vista.
- Escala tipografica consistente (titulo, subtitulo, cuerpo, ayuda).
- Espaciado por sistema de escala (ej. 4/8/12/16/24).
- Tokens de color/tema del sistema; no hardcodear colores por componente.
- Estados visuales definidos: hover, focus, active, disabled, loading.

### Accesibilidad obligatoria
- Contraste minimo 4.5:1 en texto normal.
- Foco visible en todos los elementos interactivos.
- Navegacion por teclado completa en flujo critico.
- Semantica correcta: boton para acciones, enlace para navegacion.
- Soporte de lector de pantalla en feedback y errores relevantes.

### Responsive real
- Mobile-first, viewport minimo 375px.
- No perder acciones clave en movil.
- Tablas con estrategia movil: scroll horizontal, vista card o columnas prioritarias.
- Verificar densidad de contenido para touch (targets tactiles adecuados).

## Checklist de aceptacion

1. Se usa template moderno (@if/@for/@switch) cuando aplica.
2. Listas con track estable.
3. Componente UI en OnPush.
4. Estados de interfaz completos implementados.
5. Formulario con labels, validacion contextual y bloqueo de doble envio.
6. Contraste, foco y teclado cumplen AA en flujo principal.
7. Vista funcional en 375px y desktop sin romper tareas.
8. Sin estilos hardcodeados fuera del sistema de diseno.

## Anti-patrones

- Multiples CTA primarios compitiendo en la misma vista.
- Placeholder como unica etiqueta.
- Spinners infinitos sin mensaje ni recuperacion.
- Mensajes de error genericos sin siguiente paso.
- Templates con logica de negocio o expresiones complejas repetidas.
- Uso de any en modelos de datos de formulario/UI.

## Formato de salida del agente

1. Hallazgos por severidad: alta, media, baja.
2. Cambios sugeridos concretos en template/estilos/flujo.
3. Riesgos residuales y pruebas de UI recomendadas.

## Criterio de salida

- UI consistente con sistema visual.
- Flujo principal claro, accesible y responsive.
- Template Angular moderno, legible y mantenible.
