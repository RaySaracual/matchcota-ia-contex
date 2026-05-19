---
name: UI Product Excellence Autopilot
description: Autonomous UI quality guardrails for world-class product behavior, user feedback, forms, and resilient interaction design
---

# Skill - UI Product Excellence Autopilot

Objetivo: forzar calidad de producto global en implementaciones UI para que cada flujo sea claro, confiable y robusto sin depender de recordatorios manuales.

Uso recomendado: combinar con ui-ux-standards y ui-art-direction-standards.

## Modo operativo

Este skill funciona como guardrail autonomo. El agente debe:

1. Detectar acciones criticas del flujo.
2. Exigir feedback completo por accion (loading, exito, error, recuperacion).
3. Exigir validacion de formularios end-to-end.
4. Bloquear cierre de implementacion si faltan estados o mensajes clave.

## Definicion de accion critica

Una accion es critica cuando:

- altera datos (crear/editar/eliminar/aprobar/rechazar)
- ejecuta operaciones de negocio con impacto
- consume API externa o proceso asincrono sensible
- afecta permisos, seguridad o estado final del flujo

## Protocolo obligatorio por accion (AEP - Action Experience Protocol)

Para cada accion critica implementar:

1. Precondicion visible:
- usuario entiende que va a ocurrir
- CTA con texto claro y verbo explicito

2. Loading:
- estado visible inmediato
- CTA deshabilitado para evitar doble envio
- mensaje de progreso si tarda mas de lo esperado

3. Exito:
- confirmacion explicita y entendible
- estado persistente cuando la accion es irreversible o importante
- siguiente paso sugerido

4. Error:
- mensaje accionable (que paso y que hacer)
- no exponer errores internos crudos
- opcion de reintento o salida segura

5. Recuperacion:
- rollback, undo o reintento segun criticidad
- ruta alternativa para continuar tarea principal

## Protocolo obligatorio de formularios (FVP - Form Validation Protocol)

Para cada formulario:

1. Antes de escribir:
- labels visibles
- formato esperado y restricciones claras

2. Durante edicion:
- validacion contextual en campo
- mensajes concretos por tipo de error

3. En submit:
- foco en primer error
- resumen de errores si hay multiples
- bloqueo de doble submit

4. Respuesta backend:
- mapear errores tecnicos a mensajes de negocio
- mantener datos ingresados para evitar perdida de trabajo

5. Resultado final:
- confirmacion de guardado exitoso
- evidenciar estado actualizado en pantalla

## Estados minimos por pantalla

Toda pantalla con datos debe cubrir:

1. idle
2. loading
3. success con datos
4. empty
5. error
6. forbidden/no-permission

Regla: no entregar pantalla sin todos los estados del flujo principal.

## Observabilidad UX minima

Cada flujo critico debe registrar:

1. accion iniciada
2. accion completada con exito
3. accion fallida con causa clasificada

Objetivo: poder auditar friccion y errores de usuario.

## Rubrica de excelencia de producto (0-100)

- Cobertura AEP por accion critica: 30
- Cobertura FVP en formularios: 25
- Estados completos por pantalla: 20
- Claridad de mensajes y recuperacion: 15
- Accesibilidad y teclado en flujos criticos: 10

Interpretacion:
- >= 90: nivel global
- 80-89: muy bueno, requiere pulido menor
- < 80: no cumple excelencia de producto

## Condiciones de bloqueo (NO-GO)

Bloquear entrega si ocurre cualquiera:

1. accion critica sin mensaje de exito o error
2. formulario sin validacion contextual y foco en error
3. error backend sin traduccion a mensaje de usuario
4. loading infinito sin fallback
5. flujo critico no usable por teclado

## Entregable obligatorio del agente

El agente debe incluir al final:

1. matriz AEP por accion critica
2. matriz FVP por formulario
3. lista de estados implementados por pantalla
4. rubrica de excelencia con puntaje final
5. riesgos residuales y plan de mitigacion

## Criterio de salida

- UX robusta, predecible y resiliente en escenarios reales.
- Usuario siempre sabe que paso, que hacer y como recuperarse.
- Implementacion apta para producto de nivel mundial.
