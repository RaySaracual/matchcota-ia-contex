# Skill - Angular + .NET Full-Stack Coding Standards

Aplica durante implementacion y revision de features que involucran frontend Angular y backend .NET para garantizar consistencia de contrato y calidad en ambas capas.

## Entradas

1. Contrato de la API (DTO o spec OpenAPI del feature).
2. Codigo frontend (componente, servicio Angular) y backend (controller, servicio .NET) del feature.

## Reglas de aplicacion

### Contrato
- Definir DTO de request y response antes de implementar cualquiera de las dos capas.
- Interfaz TypeScript del frontend debe tener los mismos campos y tipos que el DTO del backend.
- Si un campo es opcional en el backend, debe ser opcional en la interfaz TypeScript.

### Backend .NET
- Aplicar DOTNET-CODING-STANDARDS: controller delgado, servicio con logica, DTO validado.
- Respuesta de error: `{ code: string, message: string }` sin detalles internos.
- `[ProducesResponseType]` declarado en cada endpoint.

### Frontend Angular
- Aplicar ANGULAR-CODING-STANDARDS: servicio para HTTP, componente solo presentacion.
- Interceptor HTTP centralizado para manejo de errores de API.
- Mostrar feedback visual en estados de carga, exito y error del feature.

### Validacion
- Frontend: validadores en Reactive Form para UX inmediata.
- Backend: validadores en DTO para seguridad definitiva.
- Errores de validacion del backend mapeados al campo del formulario correspondiente.

### Autorizacion
- Guard Angular define que rutas son visibles; no es control de seguridad.
- `[Authorize(Roles = "...")]` en el endpoint backend es el control real.
- Ambos deben estar alineados en roles/permisos del mismo feature.

## Pasos de aplicacion

1. Verificar que existe contrato DTO definido para el feature.
2. Revisar que interfaz TypeScript coincide con el DTO del backend.
3. Aplicar ANGULAR-CODING-STANDARDS al codigo frontend.
4. Aplicar DOTNET-CODING-STANDARDS al codigo backend.
5. Verificar validacion en ambas capas.
6. Revisar manejo de errores y estados de carga en el frontend.

## Criterio de salida

- Contrato DTO definido y tipado en TypeScript.
- Validacion presente en frontend y backend.
- Manejo de errores consistente con estructura `{ code, message }`.
- Guards y `[Authorize]` alineados.
