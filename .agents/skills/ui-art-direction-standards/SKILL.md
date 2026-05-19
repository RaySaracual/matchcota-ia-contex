---
name: UI Art Direction Standards
description: Art direction and visual storytelling standards for high-end web interfaces
---

# Skill - UI Art Direction Standards

Objetivo: elevar la calidad visual de interfaces web para que se perciban como producto premium, manteniendo coherencia de marca, legibilidad y conversion.

Uso recomendado: complementar siempre con `ui-ux-standards` (usabilidad y accesibilidad).

## Cuando usar este skill

- Landing pages y vistas de alto impacto visual.
- Rediseno visual de producto con foco en percepcion de calidad.
- Features con fuerte componente de storytelling visual.
- Revisiones de PR enfocadas en direccion de arte y detalle de interfaz.

## Entradas minimas

1. Contexto de marca (tono, posicionamiento, personalidad).
2. Objetivo de la pantalla (informar, convertir, guiar, retener).
3. Audiencia principal y nivel de expertise.
4. Restricciones tecnicas (design system, framework, librerias).
5. Referencias visuales (2-3) con justificacion.

## Principios rectores

### 1) Intencion visual
- Cada elemento debe tener un proposito narrativo o funcional.
- Evitar decoracion sin significado.
- Definir jerarquia visual antes de definir colores o efectos.

### 2) Cohesion estetica
- Un lenguaje visual dominante por pantalla (no mezclar estilos incompatibles).
- Mantener consistencia de radios, sombras, espaciados y densidad.
- Usar una gramatica visual repetible para componentes clave.

### 3) Legibilidad y ritmo
- Escala tipografica clara y estable (H1/H2/H3/body/caption).
- Longitudes de linea y bloques de texto equilibrados.
- Espaciado como herramienta de estructura, no como relleno.

### 4) Profundidad y contraste
- Crear profundidad con capas, no con saturacion excesiva.
- Contraste visual debe guiar la mirada hacia accion o contenido clave.
- Microcontrastes para separar grupos sin ruido.

## Sistema visual minimo

### Tipografia
- Definir una familia principal y una secundaria (si aplica).
- Limitar pesos a un set reducido para evitar fragmentacion.
- Evitar mas de 3 tamanos simultaneos en una misma seccion.

### Color
- Definir paleta semantica: primario, secundario, neutros, exito, alerta, error.
- Usar tokens de color; prohibido hardcode masivo por componente.
- Respetar contraste AA para texto e interacciones.

### Espaciado y grilla
- Escala consistente (4/8/12/16/24/32).
- Grilla clara para desktop y mobile.
- Alineaciones opticas cuidadas en bloques principales.

### Forma y elevacion
- Radios consistentes para familia de componentes.
- Sombras con niveles definidos (suave/media/alta).
- Bordes y superficies usados con moderacion.

## Direccion de interaccion

### Motion (significativa)
- Animar solo cuando agrega claridad de estado.
- Duraciones cortas y consistentes (aprox. 120-280ms).
- Evitar animaciones decorativas que compitan con la tarea.

### Estados
- Definir estados visuales completos: default, hover, focus, active, disabled, loading, error, success.
- Priorizar focus visible y feedback inmediato.
- Evitar cambios bruscos de layout entre estados.

### Microcopy visual
- Titulos y labels orientados a accion o resultado.
- Mensajes de error con lenguaje concreto y accionable.
- CTA con verbo claro y contexto explicito.

## Patrones de composicion premium

### Hero o encabezado principal
- Un mensaje principal dominante.
- Subtexto corto orientado a valor.
- CTA principal unico y secundario discreto.

### Bloques de contenido
- Alternar densidad (bloques livianos y bloques ricos) para ritmo.
- Priorizar escaneo visual: subtitulos, bullets, highlights.
- Usar iconografia solo cuando agrega comprension.

### Formularios
- Jerarquia limpia con agrupacion por intencion.
- Ayuda contextual corta en campos criticos.
- Evitar interfaces sobrecargadas con demasiados campos visibles.

## Anti-patrones criticos

- Mezclar multiples estilos visuales en una misma pantalla.
- Saturar color o sombras para "parecer moderno".
- Exceso de tipografias, tamanos o pesos sin sistema.
- Efectos visuales que dificultan lectura o accion.
- Iconos o imagenes sin rol claro.

## Rubrica de direccion de arte (0-100)

- Claridad narrativa visual: 20
- Cohesion estetica: 20
- Jerarquia tipografica: 15
- Color y contraste: 15
- Ritmo espacial y composicion: 15
- Interaccion y motion: 15

Interpretacion:
- >= 85: nivel producto premium
- 70-84: calidad buena, requiere pulido
- < 70: rediseno parcial recomendado

## Pruebas minimas

1. Revision visual en 375px, 768px y desktop.
2. Prueba de foco, hover, active y disabled en componentes clave.
3. Verificacion de contraste AA en textos y CTAs.
4. Validacion de consistencia (tipografia, spacing, radios, sombras).
5. Revision de densidad visual con contenido real (no lorem ipsum).

## Salida esperada del agente

1. Diagnostico visual por severidad (alta/media/baja).
2. Propuesta de direccion visual (principios + decisiones).
3. Cambios concretos por componente (template/estilos/estados).
4. Puntaje de rubrica + riesgos residuales.

## Criterio de salida

- Interfaz coherente, legible y con identidad clara.
- Jerarquia visual que facilita tarea y comprension.
- Calidad percibida alta sin sacrificar accesibilidad ni rendimiento.
