# Skill - Security OWASP

Aplica durante el diseno, implementacion y revision de features para garantizar controles minimos de seguridad segun OWASP Top 10.

## Entradas

1. Spec del feature con seccion de contratos tecnicos (seccion 6) y criterios de aceptacion (seccion 7).
2. Codigo fuente del feature.

## Controles por aplicar

### Validacion de entradas (A03 - Inyeccion)
- Todo input externo debe validarse antes de usarse en queries, comandos o respuestas.
- Nunca concatenar input del usuario en SQL, comandos de shell ni expresiones dinamicas.
- Regla: si el valor viene del usuario, validar tipo, longitud y formato antes de procesar.

### Control de acceso (A01)
- Cada endpoint o accion debe validar que el usuario tiene el rol/permiso necesario.
- No confiar en IDs del frontend para identificar al usuario autenticado; usar el token del contexto.

### Secretos y datos sensibles (A02)
- Sin passwords, tokens ni claves en codigo fuente ni en logs.
- Variables sensibles via variables de entorno o vault; jamas hardcodeadas.

### Cabeceras y configuracion (A05)
- Cabeceras de seguridad activas en respuestas HTTP cuando aplica.
- CORS restringido a origenes conocidos.
- Sin endpoints de diagnostico expuestos en produccion.

### Logging seguro (A09)
- Loguear: autenticaciones, fallos de autorizacion, operaciones criticas.
- No loguear: passwords, tokens completos, datos personales evitables.

## Pasos de aplicacion

1. Identificar todos los inputs del feature (formularios, parametros, body, headers).
2. Verificar que cada input tiene validacion de tipo y longitud antes de usarse.
3. Verificar autorizacion en cada endpoint nuevo.
4. Verificar que no hay secretos en codigo ni logs.
5. Revisar que eventos criticos del feature quedan logueados.

## Criterio de salida

- Sin inputs sin validar que lleguen a queries o comandos.
- Sin secretos en codigo fuente ni en logs.
- Todos los endpoints del feature protegidos con verificacion de autorizacion.
