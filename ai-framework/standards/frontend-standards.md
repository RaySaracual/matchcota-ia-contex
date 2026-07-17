# Frontend Standards

> Adjusted from base - derived from ai/specs/init-spec.md

## Principles

- Component isolation
- Predictable state
- Accessibility first
- Responsive design
- Performance first

---

## Flutter Rules

- Organizar codigo con estructura feature-first (auth, profile, discovery, chat).
- Mantener estado en Riverpod (o BLoC si ya definido) fuera de widgets de presentacion.
- Evitar logica de red en widgets; usar providers/controllers dedicados.
- Reutilizar componentes UI base para tarjetas, avatares y burbujas de chat.
- Minimizar rebuilds usando providers granulares.
- Manejar permisos de geolocalizacion con flujos explicitos de consentimiento.
- No renderizar coordenadas exactas de otros usuarios en pantalla.

---

## UI Rules

- Mantener consistencia de espaciado y tipografia entre features.
- Garantizar navegacion declarativa con GoRouter.
- Soportar accesibilidad minima (semantics labels en acciones criticas).
- Disenar para telefonos pequenos y grandes (responsive mobile).
