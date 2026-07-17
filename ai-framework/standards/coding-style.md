# Coding Style Standards

> Adjusted from base - derived from ai/specs/init-spec.md

## Principles

- Clean Code
- Readability First
- Maintainability First
- Explicitness Over Cleverness
- Simplicity Over Complexity

---

## Rules

- Use meaningful naming.
- Avoid magic values.
- Prefer small functions.
- Avoid deeply nested logic.
- Separate concerns.
- Avoid duplicated logic.
- Prefer composition over inheritance.
- Document complex business logic.
- Keep modules cohesive.
- Keep dependencies explicit.
- Use domain language explicitly: Dog, Swipe, Match, Message, Discovery.
- Keep API contracts immutable once released; version breaking changes.
- Keep DTOs and entities separated in all layers.
- Prefer async I/O end-to-end in backend services and repositories.
- Keep Flutter widgets presentational; move orchestration to controllers/providers.

---

## Naming

- Use descriptive names.
- Avoid abbreviations.
- Use consistent naming conventions.
- Keep naming aligned with domain terminology.
- Backend: PascalCase for types, camelCase for locals, suffix Service/Repository/Dto.
- Flutter: snake_case file names, PascalCase widget/class names.

---

## Code Quality

- No dead code.
- No commented-out code.
- Avoid unnecessary comments.
- Prefer self-documenting code.
- Handle errors explicitly.
