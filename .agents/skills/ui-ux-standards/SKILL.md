---
name: UI UX Standards
description: Modern UI UX standards for Angular interfaces
---

# Skill - UI/UX Modern Angular Standards

Objetivo: disenar e implementar interfaces Angular de calidad de producto, con alto nivel de usabilidad, accesibilidad AA, rendimiento y consistencia visual.

Meta operativa: cada entrega UI debe ser util, entendible y verificable por checklist tecnico y UX.

## Cuando usar este skill

- Nuevas pantallas o flujos en Angular.
- Refactor visual de componentes existentes.
- Revisiones de PR con impacto en template, estilos o usabilidad.

## Entradas minimas

1. Spec funcional del feature.
2. Usuario objetivo y tarea principal.
3. Restricciones de UI (design system, librerias, tema).
4. Estados requeridos: cargando, error, vacio, con datos, sin permisos.
5. Prioridad de negocio de la vista (accion principal, accion secundaria, lectura).
6. Criterios de aceptacion de UX (tiempos, claridad, recuperacion de errores).

## Marco de calidad obligatorio (no negociable)

### 1) Claridad de tarea
- La vista responde en menos de 5 segundos a esta pregunta: "Que tengo que hacer aqui?".
- Existe una sola accion primaria dominante por pantalla.
- El contenido relevante queda visible sin scroll excesivo en 375px y desktop.

### 2) Control y feedback
- Cada accion del usuario tiene feedback inmediato (visual, texto o cambio de estado).
- Errores deben explicar causa y siguiente paso.
- Estados de progreso deben ser finitos y recuperables.
- Cada accion critica debe dejar evidencia visible de resultado (toast, inline, estado persistente o timeline).

### 3) Accesibilidad real
- Contraste AA: minimo 4.5:1 para texto normal.
- Navegacion por teclado completa en el flujo principal.
- Foco visible y consistente en elementos interactivos.
- Semantica correcta y labels accesibles en formularios.

### 4) Rendimiento perceptual
- Primer contenido significativo sin bloqueos innecesarios.
- Evitar componentes pesados en carga inicial (usar @defer cuando aplique).
- Evitar re-render innecesario en listas y formularios.

### 5) Consistencia de sistema
- Espaciado, tipografia, color y estados definidos por tokens del sistema.
- Prohibido hardcodear estilos de marca por componente.
- Misma interaccion para patrones repetidos (tabla, filtro, modal, formulario).

## Reglas Angular para UI moderna

### Arquitectura de componente
- Preferir componentes standalone.
- Usar OnPush por defecto en componentes de UI.
- Separar contenedor (estado/orquestacion) de presentacional (render y eventos).
- Evitar logica compleja en el template; mover a propiedades computadas.
- Definir un view-model por pantalla para concentrar estados de UI.
- Evitar side effects de UI dentro de getters o computed complejos.

### Template moderno (Angular 17+)
- Usar control flow nuevo: @if, @for, @switch.
- En listas, usar track estable en @for para evitar rerenders innecesarios.
- Usar @defer en bloques pesados o secundarios para mejorar carga inicial.
- Evitar anidamiento profundo de condiciones; simplificar con view-model.
- Evitar mas de 2 niveles de nesting condicional en una misma seccion.
- Priorizar templates legibles sobre templates "inteligentes".

### Estado y reactividad
- Preferir signals y computed para estado local de UI.
- Efectos solo para sincronizacion con servicios externos.
- Usar async pipe o lectura de signals; evitar subscribe manual en componente de UI.
- Modelar estados explicitos: idle, loading, success, empty, error, forbidden.

### Formularios
- Reactive Forms para validacion real de negocio.
- Labels visibles siempre, nunca solo placeholder.
- Validacion en contexto junto al campo.
- Mensajes de error accionables y especificos.
- Mostrar criterio de formato antes de que el usuario falle (prevencion).
- Bloquear doble submit y mostrar estado de envio.
- Mantener foco en primer error al validar submit.
- Mostrar mensaje explicito de exito o fallo al enviar formulario.
- Si backend devuelve error, mapearlo a mensaje util para usuario (no mostrar error tecnico crudo).

### Diseno visual moderno
- Jerarquia clara: una accion primaria por vista.
- Escala tipografica consistente (titulo, subtitulo, cuerpo, ayuda).
- Espaciado por sistema de escala (ej. 4/8/12/16/24).
- Tokens de color/tema del sistema; no hardcodear colores por componente.
- Estados visuales definidos: hover, focus, active, disabled, loading.
- Priorizar legibilidad y contraste por sobre "estetica".
- Evitar sobrecarga visual: bordes, sombras y colores solo cuando aporten significado.

### Accesibilidad obligatoria
- Contraste minimo 4.5:1 en texto normal.
- Foco visible en todos los elementos interactivos.
- Navegacion por teclado completa en flujo critico.
- Semantica correcta: boton para acciones, enlace para navegacion.
- Soporte de lector de pantalla en feedback y errores relevantes.
- aria-live para mensajes dinamicos (error, guardado, estado async).
- No depender solo de color para comunicar estado.

### Responsive real
- Mobile-first, viewport minimo 375px.
- No perder acciones clave en movil.
- Tablas con estrategia movil: scroll horizontal, vista card o columnas prioritarias.
- Verificar densidad de contenido para touch (targets tactiles adecuados).
- Objetivo touch: minimo 44x44 px en elementos interactivos principales.

## Patrones obligatorios por tipo de pantalla

### Pantalla de lista
- Filtro/busqueda visible y estado vacio util.
- Orden y paginacion claros si aplica.
- Acciones por fila con confirmacion cuando sean destructivas.

### Pantalla de detalle
- Resumen arriba, acciones al alcance sin ruido.
- Informacion agrupada por bloques con titulos claros.
- Estados de carga parcial sin parpadeo de contenido.

### Formulario de creacion/edicion
- Secciones cortas y progresivas.
- Validacion inmediata en campos criticos.
- Confirmacion de exito y ruta de salida clara.

## Matriz obligatoria de acciones de usuario

Para cada accion interactiva del flujo principal se debe definir y cubrir:

1. Accion: que hace el usuario.
2. Trigger: boton/enlace/atajo que la dispara.
3. Estado loading: que ve el usuario mientras se procesa.
4. Exito: mensaje o estado visible de confirmacion.
5. Error: mensaje accionable con siguiente paso.
6. Reintento o recuperacion: como continuar sin bloquear la tarea.

Regla: no se acepta PR sin matriz completa para acciones criticas.

## Guardrails de implementacion inteligente

El agente debe asumir por defecto que faltan mensajes de usuario hasta demostrar lo contrario.

Checklist automatico previo a cerrar implementacion:

1. Toda accion primaria tiene feedback de exito/error.
2. Todo formulario tiene validacion previa, durante y posterior al submit.
3. Todo estado async tiene loading finito + timeout o fallback.
4. Todo error tecnico se traduce a mensaje entendible por usuario.
5. Todo flujo critico es operable por teclado y lector de pantalla.

## Rubrica de evaluacion UX/UI (0-100)

- Claridad de tarea: 20
- Accesibilidad: 20
- Feedback y errores: 15
- Consistencia visual: 15
- Responsive y touch: 15
- Rendimiento percibido: 15

Regla:
- >= 85: listo para merge
- 70-84: requiere ajustes antes de merge
- < 70: bloquear entrega UI

## Checklist de aceptacion

1. Se usa template moderno (@if/@for/@switch) cuando aplica.
2. Listas con track estable.
3. Componente UI en OnPush.
4. Estados de interfaz completos implementados.
5. Formulario con labels, validacion contextual y bloqueo de doble envio.
6. Contraste, foco y teclado cumplen AA en flujo principal.
7. Vista funcional en 375px y desktop sin romper tareas.
8. Sin estilos hardcodeados fuera del sistema de diseno.
9. Mensajes de error con accion de recuperacion.
10. Estado vacio con siguiente paso concreto.
11. Score de rubrica UX/UI documentado en PR.
12. Matriz de acciones de usuario documentada y cumplida.
13. Confirmaciones de exito/error visibles en todas las acciones criticas.
14. Errores backend traducidos a lenguaje de usuario.

## Anti-patrones

- Multiples CTA primarios compitiendo en la misma vista.
- Placeholder como unica etiqueta.
- Spinners infinitos sin mensaje ni recuperacion.
- Mensajes de error genericos sin siguiente paso.
- Templates con logica de negocio o expresiones complejas repetidas.
- Uso de any en modelos de datos de formulario/UI.
- CTA destructivo sin confirmacion o undo.
- UI que depende de tooltip para informacion critica.
- Skeleton/spinner sin timeout ni fallback de error.
- Guardar/enviar sin feedback posterior al usuario.
- Validar solo en backend sin guia previa en UI.
- Mensajes de exito efimeros sin estado persistente cuando la accion es critica.

## Pruebas minimas obligatorias

1. Prueba manual teclado en flujo critico (tab, shift+tab, enter, escape).
2. Prueba visual en 375px, 768px y desktop.
3. Prueba de estados: loading, empty, error, forbidden, success.
4. Prueba de formulario: validaciones, foco en error, doble submit.
5. Verificacion de contraste en textos y botones principales.
6. Prueba de accion critica: exito, error y reintento en la misma sesion.
7. Prueba de submit con backend fallando (mensaje util + recuperacion).

## Contrato de salida del agente (implementacion)

El agente debe entregar:

1. Resumen de decisiones UI/UX tomadas y por que.
2. Lista de estados implementados por pantalla.
3. Riesgos pendientes de UX (si existen).
4. Resultado de rubrica UX/UI (puntaje + evidencia).
5. Matriz de acciones de usuario con cobertura exito/error/reintento.

## Formato de salida del agente

1. Hallazgos por severidad: alta, media, baja.
2. Cambios sugeridos concretos en template/estilos/flujo.
3. Riesgos residuales y pruebas de UI recomendadas.

## Criterio de salida

- UI consistente con sistema visual.
- Flujo principal claro, accesible y responsive.
- Template Angular moderno, legible y mantenible.
- Feedback, errores y estados completos con evidencia verificable.

