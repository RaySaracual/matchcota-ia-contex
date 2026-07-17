# Integration Architecture - Matchcota MVP

## External Integrations

- Geolocalizacion dispositivo (frontend, paquete geolocator).
- Almacenamiento multimedia en S3 o Firebase Storage.
- CI/CD en GitHub Actions.

## Integration Boundaries

- API controla contratos con frontend via DTOs versionados.
- Infrastructure encapsula SDKs externos de storage.
- Services no dependen de detalles de proveedor multimedia.

## Media Flow

1. Usuario selecciona foto/video.
2. Frontend sube archivo via flujo autorizado.
3. Backend persiste metadata (DogMedia) y referencia segura.

## Reliability Rules

- Timeouts y reintentos acotados para operaciones de storage.
- Validacion de tipo/tamano de archivo antes de persistir.
- Manejo de fallos parciales con compensacion simple.

## Observability

- Trazar tiempos de subida de media y errores de proveedor.
- Etiquetar logs por modulo de integracion.
