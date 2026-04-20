# Agent Guide - Security OWASP Top 10

Objetivo: aplicar controles minimos de seguridad basados en OWASP Top 10 durante la implementacion y revision de cualquier feature.

## Alcance

Aplica a cualquier stack. Complementar con skills especificos de stack cuando corresponda.

## Controles obligatorios

### A01 - Control de acceso roto
- Verificar autorizacion en cada endpoint/accion, no solo autenticacion.
- No exponer datos de otros usuarios por manipulacion de IDs en URL o body.
- Aplicar principio de minimo privilegio: el usuario solo accede a lo que necesita.

### A02 - Fallas criptograficas
- No almacenar ni loguear passwords, tokens ni secretos en texto plano.
- Usar HTTPS en todos los ambientes (no solo produccion).
- No incluir secretos en codigo fuente, variables en repo ni logs.

### A03 - Inyeccion
- Usar queries parametrizadas o ORMs; nunca concatenar input del usuario en SQL.
- Validar y sanitizar toda entrada externa antes de usarla.
- Aplicar en: SQL, NoSQL, LDAP, comandos de sistema operativo, XML/JSON.

### A04 - Diseno inseguro
- Modelar casos de abuso junto con casos de uso funcionales.
- Revisar flujos criticos (pagos, cambios de rol, eliminacion de datos) con validaciones extra.

### A05 - Configuracion de seguridad incorrecta
- No usar configuraciones por defecto de frameworks (admin/admin, debug=true).
- Deshabilitar features no usados (CORS abierto, endpoints de diagnostico en produccion).
- Cabeceras de seguridad HTTP activas (CSP, X-Frame-Options, Strict-Transport-Security).

### A06 - Componentes vulnerables
- Mantener dependencias actualizadas; revisar CVEs criticos antes de cada release.
- No usar librerias abandonadas sin evaluacion de riesgo.

### A07 - Fallas de identificacion y autenticacion
- Bloqueo de cuenta o delay ante intentos fallidos repetidos.
- Tokens con expiracion corta y revocacion implementada.
- MFA en operaciones criticas si aplica al proyecto.

### A08 - Fallas de integridad de software y datos
- Validar integridad de dependencias (checksums, lock files comprometidos en repo).
- No deserializar datos no confiables sin validacion de esquema estricta.

### A09 - Registro y monitoreo insuficiente
- Loguear eventos de autenticacion, autorizacion fallida y operaciones criticas.
- No incluir datos sensibles en logs (passwords, tokens, PII evitable).
- Los logs deben ser trazables por sesion o usuario.

### A10 - Server-side request forgery (SSRF)
- Validar y restringir URLs de destino cuando el servidor realiza requests externos por input del usuario.
- No permitir acceso a redes internas desde inputs controlados por el usuario.

## Secuencia de revision por feature

1. Identificar endpoints o acciones nuevas.
2. Revisar control de acceso en cada uno.
3. Verificar que no hay inputs sin validar usados en queries o comandos.
4. Revisar manejo de secretos en el codigo del feature.
5. Verificar que eventos criticos del feature quedan logueados.

## Criterio de aceptacion

- Sin inyecciones SQL/NoSQL posibles en el feature.
- Sin secretos en codigo ni logs.
- Todos los endpoints protegidos con autorizacion explicita.
