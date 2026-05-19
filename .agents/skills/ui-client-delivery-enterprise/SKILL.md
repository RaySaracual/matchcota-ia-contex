---
name: UI Client Delivery Enterprise
description: Enterprise-grade UI/UX delivery framework for client-ready products, with mandatory design, validation, and quality gates
---

# Skill - UI Client Delivery Enterprise

Objetivo: asegurar entregas de UI/UX de nivel cliente empresarial, con evidencia de calidad visual, usabilidad, accesibilidad y rendimiento antes de presentacion.

Uso recomendado: aplicar junto con `ui-ux-standards`, `ui-art-direction-standards` y `ui-product-excellence-autopilot`.

## Alcance

Esta skill aplica para:

1. Features visibles para cliente o stakeholders.
2. Flujos criticos de conversion/operacion.
3. Demos y releases con impacto comercial.

## Herramientas recomendadas (stack profesional)

### Diseno y prototipado
- Figma (design system, prototipo, handoff).
- Variables/tokens en Figma (color, spacing, typography).
- Plugin de contraste/accesibilidad (ej. Stark).

### Sistema de diseno en codigo
- Storybook para documentacion de componentes.
- Tokens centralizados (Style Dictionary o equivalente).
- Libreria de iconos consistente (Lucide/Heroicons o equivalente).

### Calidad y validacion
- Playwright para pruebas E2E de flujos criticos.
- axe-core para accesibilidad automatizada.
- Lighthouse para performance y buenas practicas UX.
- Capturas visuales de referencia (antes/despues).

### Validacion de uso real
- Herramienta de sesion/heatmap (Hotjar/Clarity o equivalente).
- Test de prototipo con usuarios (Maze/Useberry o equivalente).

## Flujo obligatorio por feature (Client-Ready Pipeline)

1. Definicion:
- objetivo de negocio
- usuario objetivo
- tarea principal
- metrica de exito

2. Diseno:
- wireframe funcional
- alta fidelidad
- prototipo navegable

3. Validacion temprana:
- 3-5 usuarios representativos
- registro de hallazgos
- ajustes de UX antes de implementar

4. Implementacion:
- componentes con design tokens
- estados completos (idle/loading/empty/error/forbidden/success)
- feedback de acciones criticas

5. QA tecnico y UX:
- accesibilidad (AA)
- responsive (375/768/desktop)
- pruebas de flujos criticos
- rendimiento perceptual

6. Evidencia de cierre:
- checklist de calidad
- score de rubrica
- riesgos residuales
- decision GO/NO-GO

## Criterios minimos para presentacion a cliente

### Calidad de experiencia
1. Toda accion critica tiene feedback de loading, exito y error.
2. Formularios con validacion contextual y recuperacion.
3. Mensajes de error accionables y no tecnicos.
4. Estado vacio util y CTA claro.

### Calidad visual
1. Coherencia de tipografia, espaciado y color.
2. Jerarquia visual clara y CTA primaria dominante.
3. Consistencia de componentes en todo el flujo.

### Calidad tecnica
1. Accesibilidad AA en flujo principal.
2. Navegacion por teclado funcional.
3. Sin regresiones evidentes en responsive.
4. Rendimiento aceptable para primera interaccion.

## Rubrica Client-Ready (0-100)

- Usabilidad y claridad: 20
- Feedback y resiliencia de acciones: 20
- Accesibilidad: 20
- Consistencia visual y direccion de arte: 15
- Responsive y adaptabilidad: 10
- Rendimiento percibido: 10
- Evidencia de validacion con usuarios: 5

Umbrales:
- >= 90: listo para cliente enterprise
- 80-89: listo con observaciones menores
- < 80: no presentar a cliente

## Condiciones de bloqueo (NO-GO)

Bloquear entrega si ocurre cualquiera:

1. Falta feedback en acciones criticas.
2. No hay validacion de formulario completa.
3. No cumple accesibilidad AA minima.
4. No existen pruebas de flujo critico.
5. No hay evidencia de validacion UX (aunque sea interna).

## Entregable obligatorio del agente

El agente debe entregar:

1. Resumen de decisiones UX/UI y de negocio.
2. Matriz de acciones criticas con cobertura de estados.
3. Checklist de accesibilidad y responsive.
4. Rubrica Client-Ready con puntaje final.
5. Riesgos residuales y plan de mitigacion.
6. Recomendacion final: GO o NO-GO para presentacion.

## Criterio de salida

- Experiencia estable, clara y defendible frente a cliente.
- Evidencia objetiva de calidad, no solo apreciacion estetica.
- Flujo listo para demo y para uso real.
