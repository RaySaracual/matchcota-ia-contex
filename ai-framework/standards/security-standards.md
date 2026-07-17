# Security Standards

> Adjusted from base - derived from ai/specs/init-spec.md

## Principles

- Least privilege
- Secure by default
- Defense in depth
- Explicit validation

---

## Rules

- Validar toda entrada de API y aplicar tamanos maximos de payload/media.
- Nunca exponer secretos ni credenciales en codigo o logs.
- Usar JWT con expiracion corta y refresh strategy definida.
- Aplicar autorizacion por recurso propietario (perro, match, chat).
- Forzar HTTPS en todos los ambientes expuestos.
- Proteger endpoints contra brute force con rate limiting.
- Hashear contrasenas con BCrypt o Argon2 cuando aplique email/password.
- Mitigar injection, IDOR y mass assignment siguiendo OWASP ASVS.
- Redactar en logs todo dato sensible y coordenadas exactas.
