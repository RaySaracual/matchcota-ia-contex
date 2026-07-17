# API Standards

> Adjusted from base - derived from ai/specs/init-spec.md

## Principles

- RESTful design
- Consistency
- Predictable responses
- Explicit validation
- Secure by default

---

## Rules

- Version all endpoints with /api/v1.
- Implement REST resources for auth, dogs, discovery, swipes, matches and messages.
- Use explicit request/response DTOs; never return EF entities directly.
- Validate payloads with FluentValidation or DataAnnotations before service execution.
- Standardize errors with RFC7807 ProblemDetails.
- For discovery responses, expose distanceKm only; never expose exact lat/lng of other users.
- Use cursor or page+size pagination for list endpoints (matches/messages).
- Return 401/403 consistently for auth/authorization failures.

---

## Security

- Require JWT Bearer in all routes except registration/login and health checks.
- Enforce ownership checks (dog profile, media, messages and match scope).
- Rate-limit auth and swipe endpoints to prevent abuse.
- Never include password hash, refresh token or raw location in API responses.
