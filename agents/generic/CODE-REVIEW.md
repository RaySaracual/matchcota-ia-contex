# Agent Guide - Code Review

Objetivo: revisar pull requests y cambios de codigo antes de mergear, aplicando criterios de calidad, seguridad y trazabilidad al spec de la feature.

## Alcance

Aplica a cualquier stack. Complementar con skills especificos del stack cuando se revisen aspectos tecnologicos puntuales.

## Checklist de revision

### Trazabilidad con spec
- [ ] El cambio tiene un featureId trazable en el spec de intake.
- [ ] Los criterios de aceptacion del spec estan cubiertos por los cambios.
- [ ] No hay logica implementada fuera del alcance del spec sin justificacion.

### Calidad de codigo
- [ ] Aplicar CLEAN-CODE.md: nombres claros, funciones con responsabilidad unica, sin duplicacion evidente.
- [ ] No hay codigo comentado sin justificacion.
- [ ] Sin TODOs sin fecha y responsable.
- [ ] Complejidad ciclomatica razonable (no superar 10 por funcion sin justificacion).

### Seguridad
- [ ] Aplicar SECURITY-OWASP.md: sin inyecciones, sin secretos expuestos, control de acceso verificado.
- [ ] Entradas validadas en los limites del sistema.

### Pruebas
- [ ] Cambios acompanados de pruebas o ajuste de pruebas existentes si aplica.
- [ ] Casos de prueba del spec reflejan los cambios implementados.

### Contrato y API
- [ ] Cambios en API o contratos reflejados en la documentacion del contrato (OpenAPI, DTO, esquema).
- [ ] Sin breaking changes no comunicados.

### Configuracion y secretos
- [ ] Sin secretos ni credenciales hardcodeadas.
- [ ] Variables de entorno nuevas documentadas en el README o spec del feature.

## Criterios de aprobacion

- Todos los items criticos marcados (trazabilidad, seguridad, contratos).
- Minimo 1 revisor distinto al autor.
- Sin bloqueos de QA locales abiertos para el featureId.

## Criterios para solicitar cambios

- Cualquier item de seguridad sin cumplir.
- Logica fuera del alcance del spec sin aprobacion del equipo.
- Breaking change sin contrato actualizado.
