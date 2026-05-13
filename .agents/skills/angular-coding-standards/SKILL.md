---
name: Angular Coding Standards
description: Angular implementation and review standards
---

# Skill - Angular Coding Standards

Aplica durante implementacion y revision de codigo en proyectos Angular para garantizar consistencia con los estandares del framework.

## Entradas

1. Componente, servicio o modulo a revisar o implementar.
2. Spec del feature para validar que el patron elegido es adecuado al alcance.

## Reglas de aplicacion

### Nomenclatura
- Archivos: kebab-case con sufijo de tipo (`usuario.service.ts`, `login.component.ts`).
- Clases: PascalCase con sufijo de tipo (`UsuarioService`, `LoginComponent`).
- Variables y propiedades: camelCase.
- Constantes de modulo o configuracion: UPPER_SNAKE_CASE.
- Selectores de componente: prefijo del proyecto en kebab-case (`app-login`, `cfh-tabla-usuarios`).

### Componentes
- Separar logica en servicio antes de que el componente supere 100 lineas.
- Inputs y Outputs tipados; sin `any`.
- `ChangeDetectionStrategy.OnPush` en componentes presentacionales.

### Servicios
- Proveer en `root` o en el modulo correspondiente, no en ambos.
- Retornar `Observable<T>`, no `Promise` salvo casos justificados.
- Manejo de errores con `catchError` que retorne observable de error tipado.

### Modulos
- `forRoot` para configuracion de singleton; `forChild` para modulos lazy.
- Declarar solo en el modulo dueno; no redeclarar en SharedModule.

### Suscripciones
- Usar `async pipe` en templates cuando sea posible.
- Si se suscribe en componente, usar `takeUntilDestroyed` o desuscribir en `ngOnDestroy`.

## Pasos de aplicacion

1. Verificar nomenclatura de archivos y clases.
2. Revisar que logica de negocio esta en servicios.
3. Verificar tipado (sin `any`).
4. Revisar gestion de suscripciones.
5. Verificar que componentes presentacionales usan OnPush.

## Criterio de salida

- Nomenclatura consistente con estandar del proyecto.
- Sin logica de negocio en componentes.
- Sin suscripciones activas al destruir el componente.

