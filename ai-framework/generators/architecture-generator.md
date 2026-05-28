# Architecture Generator

## Purpose

Generate scalable technical architecture documentation based on:

- specifications
- stack
- scalability requirements
- domain complexity
- integration needs
- security requirements

---

# Responsibilities

- Define system architecture.
- Define frontend architecture.
- Define backend architecture.
- Define integration architecture.
- Define communication patterns.
- Define authentication strategy.
- Define deployment strategy.
- Define observability strategy.
- Define modularization strategy.
- Define scalability strategy.
- Define testing architecture.

---

# Input Sources

Read:

```txt
ai/specs/*
ai/context/*
```

---

# Output

Generate:

```txt
ai/architecture/*
```

Examples:

```txt
system-overview.md
frontend-architecture.md
backend-architecture.md
security-architecture.md
integration-architecture.md
```

---

# Rules

* Architecture must follow project standards.
* Prefer simplicity over unnecessary complexity.
* Avoid overengineering.
* Design for maintainability.
* Design for scalability.
* Design for observability.
* Design for testability.
* Design for modularity.
* Explicitly document tradeoffs.

---

# Required Sections

1. Overview
2. Architectural Style
3. Frontend Structure
4. Backend Structure
5. Data Flow
6. Communication Strategy
7. Security Model
8. State Management
9. Error Handling
10. Logging Strategy
11. Monitoring Strategy
12. Deployment Strategy
13. Scalability Strategy
14. Risks
15. Technical Constraints
16. ADR References

---

# Operational Behavior

* Keep architecture aligned with specs.
* Keep architecture aligned with standards.
* Update architecture when major changes occur.
* Register important tradeoffs as ADRs.
