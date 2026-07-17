# Sprint 04 - QA Checklist Windows + Chrome

## Scope

Validar estabilizacion post-Sprint 03 en dos clientes simultaneos:
- Cliente A: Windows desktop (Flutter).
- Cliente B: Chrome Web.

## Preconditions

1. API backend ejecutando en http://localhost:5269.
2. Datos semilla cargados (`seed-dev-data.ps1`).
3. Frontend Windows y Chrome apuntando al mismo `API_BASE_URL`.
4. Dos cuentas de prueba disponibles (o registro habilitado).

## Environment Matrix

- OS: Windows 11
- App Desktop: Flutter Windows
- App Web: Chrome (puerto 7357 o configurado)

## Checklist

1. Sesion concurrente estable
- [ ] Iniciar sesion con la misma cuenta en Windows y Chrome.
- [ ] Navegar Auth -> Profile -> Discovery -> Chat en ambos clientes.
- [ ] Confirmar que no hay bloqueos ni cierres inesperados.

2. 401 fuerza relogin claro (BL-012)
- [ ] Invalidar token en uno de los clientes (logout en backend, token viejo o reinicio de sesion).
- [ ] Ejecutar accion autenticada (`GET /dogs/mine` o enviar mensaje).
- [ ] Verificar limpieza de token local y redireccion funcional a tab Auth.
- [ ] Verificar banner persistente: "Tu sesion expiro (401). Reingresa para continuar.".
- [ ] Reingresar credenciales y confirmar que el banner desaparece al restaurar sesion.

3. Fallback realtime con retry manual (BL-013)
- [ ] Abrir una conversacion activa en ambos clientes.
- [ ] Simular caida realtime (detener hub o red temporal).
- [ ] Verificar banner persistente de fallback (reconnecting/disconnected/error).
- [ ] Enviar mensaje durante la caida y validar envio por HTTP.
- [ ] Pulsar "Reintentar" y confirmar reconexion realtime cuando el hub vuelve.

4. Realtime entre clientes
- [ ] Con hub activo, enviar mensaje desde Windows y recibir en Chrome.
- [ ] Enviar mensaje desde Chrome y recibir en Windows.
- [ ] Confirmar badge de estado: Conectado/Reconnecting/Error coherente.

5. Regression smoke
- [ ] Editar perfil canino (nombre/bio) y guardar.
- [ ] Activar/desactivar perfil.
- [ ] Validar discovery funcional despues de cambios de perfil.

## Evidence To Attach

1. Video corto: 401 -> banner -> relogin exitoso.
2. Video corto: caida realtime -> banner fallback -> retry -> recuperacion.
3. Captura Windows y Chrome con chat sincronizado.
4. Extracto de logs backend con request-id para un error controlado.

## Expected Result

- El flujo de sesion es recuperable sin estado corrupto.
- El chat conserva operacion via HTTP cuando realtime cae.
- QA puede reproducir y validar en Windows + Chrome consistentemente.
