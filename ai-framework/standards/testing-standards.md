# Testing Standards

> Adjusted from base - derived from ai/specs/init-spec.md

## Principles

- Test behavior, not implementation.
- Prefer deterministic tests.
- Protect critical workflows.
- Prevent regressions.

---

## Rules

- Crear unit tests para servicios criticos: Auth, Discovery, Match y Message.
- Crear integration tests para endpoints REST con base de datos de prueba.
- Probar casos geoespaciales limite (radio exacto, sin candidatos, candidatos ya swipeados).
- Validar reglas de privacidad: API no debe devolver lat/lng de terceros.
- Validar autorizacion: acceso solo a recursos del usuario autenticado.
- Ejecutar widget tests en Flutter para flujos auth, swipe y chat.
- Mantener tests deterministas con datos controlados y reloj estable.

---

## Coverage

- Priorizar cobertura en onboarding, discovery, swipe->match y chat.
- Cubrir reglas de negocio de match mutuo y filtros de exclusiones.
- Cubrir integraciones de almacenamiento multimedia y geolocalizacion.
