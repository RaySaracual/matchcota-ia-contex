# Product Backlog (MVP)

- BL-001 | Registro/Login con JWT | Prioridad: Alta | Dependencias: Ninguna | Criterio: Usuario obtiene token valido y accede a endpoints protegidos
- BL-002 | CRUD perfil de perro + multimedia | Prioridad: Alta | Dependencias: BL-001 | Criterio: Perfil editable con al menos una foto publicada
- BL-003 | Discovery geoespacial por distancia | Prioridad: Alta | Dependencias: BL-001, BL-002 | Criterio: Endpoint devuelve candidatos cercanos excluyendo ya swipeados
- BL-004 | Swipe y creacion de Match mutuo | Prioridad: Alta | Dependencias: BL-003 | Criterio: Match persistido solo ante aceptacion mutua
- BL-005 | Chat en tiempo real por Match | Prioridad: Alta | Dependencias: BL-004 | Criterio: Mensajes enviados/recibidos en sala autorizada
- BL-006 | Privacidad de ubicacion (distancia relativa) | Prioridad: Alta | Dependencias: BL-003 | Criterio: Ningun endpoint expone lat/lng exacta de terceros
- BL-007 | CI/CD con build y test base | Prioridad: Media | Dependencias: BL-001 | Criterio: Pipeline ejecuta build y tests en PR/main
- BL-008 | Observabilidad minima (logs estructurados) | Prioridad: Media | Dependencias: BL-001 | Criterio: Logs de auth, discovery y errores criticos trazables
- BL-009 | Seguridad de sesion (refresh token + revocacion) | Prioridad: Alta | Dependencias: BL-001 | Criterio: Sesion renovable sin relogin frecuente y revocable por servidor
- BL-010 | Inbox de chats + no leidos | Prioridad: Alta | Dependencias: BL-005 | Criterio: Usuario ve conversaciones, ultimo mensaje y contador no leido
- BL-011 | Safety controls (reportar/bloquear) | Prioridad: Media | Dependencias: BL-004, BL-005 | Criterio: Usuario puede reportar/bloquear y deja de ver/interactuar con perfil bloqueado
