# Agent Guide - Angular Best Practices

Objetivo: guiar la implementacion de features en proyectos Angular aplicando patrones y convenciones del framework para garantizar consistencia, rendimiento y mantenibilidad.

## Alcance

Aplica a proyectos con stack `angular` o `angular-dotnet`. Complementar con CLEAN-CODE.md y SECURITY-OWASP.md.

## Arquitectura y modularizacion

- Organizar por modulos de dominio/negocio, no por tipo de archivo.
- Cada modulo: componentes, servicios, modelos y rutas propias.
- Usar `SharedModule` solo para elementos reutilizados en mas de dos modulos.
- Lazy loading en rutas de modulos para reducir bundle inicial.

## Componentes

- Un componente, una responsabilidad de presentacion.
- Componentes "smart" (containers) gestionan estado y llaman servicios.
- Componentes "dumb" (presentacionales) solo reciben inputs y emiten outputs.
- No inyectar HttpClient directamente en componentes; delegar a servicios.
- Destruir suscripciones en `ngOnDestroy` (o usar `takeUntilDestroyed`).

## Servicios y estado

- Logica de negocio y acceso a API siempre en servicios, nunca en componentes.
- Un servicio por dominio funcional (`UsuarioService`, `FacturaService`).
- Tipar todos los retornos HTTP con interfaces; no usar `any`.
- Usar `catchError` en observables que llaman a API; no dejar errores sin manejar.

## Formularios

- Usar Reactive Forms para formularios con validaciones de negocio.
- Template-driven solo para formularios simples sin validacion compleja.
- Validadores personalizados como funciones puras testeables.

## Tipado

- `strict: true` en tsconfig; sin `any` sin justificacion documentada.
- Interfaces para modelos de datos; no usar clases donde basta una interfaz.
- Generics donde se repite logica con distintos tipos.

## Secuencia operativa

1. Revisar modularizacion antes de crear componente nuevo.
2. Verificar que la logica esta en servicios, no en componentes.
3. Aplicar CLEAN-CODE para nombres y responsabilidades.
4. Verificar tipado estricto y gestion de suscripciones.
5. Aplicar SECURITY-OWASP para validacion de inputs y autorizacion en guards.

## Criterio de aceptacion

- Sin logica de negocio en componentes.
- Sin suscripciones sin destruir.
- Sin `any` sin justificacion.
- Lazy loading aplicado en modulos de dominio.
