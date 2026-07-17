# Security Architecture - Matchcota MVP

## AuthN and AuthZ

- JWT Bearer para autenticacion de API.
- [Authorize] en todos los endpoints salvo login/registro/health.
- Verificacion de ownership para recursos de perfil, media, match y chat.

## Sensitive Data Handling

- Hash de contrasenas con BCrypt o Argon2.
- Secrets gestionados por variables de entorno.
- Redaccion de datos sensibles en logs.

## Location Privacy Model

- Coordenadas exactas solo en backend para calculo.
- API publica distancia relativa en km.
- Validaciones para impedir filtrado indirecto de lat/lng.

## Secure Transport

- HTTPS obligatorio.
- CORS restringido por ambiente.

## Threat Mitigations

- Rate limiting en auth y endpoints vulnerables a abuso.
- Validacion de inputs y tamanos de media.
- Proteccion contra injection e IDOR.

## Security Logging

- Registro de intentos fallidos de login.
- Registro de accesos denegados por autorizacion.
- Registro de eventos de seguridad de alto impacto.
