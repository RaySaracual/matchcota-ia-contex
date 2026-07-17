# Match Chat Flow Skill

## Purpose

Estandarizar el flujo transaccional swipe positivo -> match -> habilitacion de chat.

## Context Requirements

- Entidades Swipe, Match y Message disponibles.
- Usuario autenticado.
- Reglas de negocio de match mutuo vigentes.

## Preconditions

- Persistencia de swipes operativa.
- Validacion de ownership en endpoints de chat.

## Execution Steps

1. Registrar swipe del usuario actual.
2. Verificar si existe swipe positivo reciproco.
3. Crear Match si ambos son positivos y aun no existe.
4. Habilitar canal de chat para participantes del match.
5. Permitir envio de mensajes solo dentro del contexto del match.

## Expected Output

- Match creado de forma idempotente.
- Chat habilitado solo para usuarios autorizados.

## Validation Rules

- No debe existir chat sin match vigente.
- Repeticion de eventos no debe duplicar match.
- Mensajes deben rechazar usuarios no participantes.

## Failure Conditions

- Inconsistencia transaccional entre swipe y match.
- Validacion de autorizacion incompleta en chat.

## Related Standards

- ai-framework/standards/api-standards.md
- ai-framework/standards/security-standards.md
- ai-framework/standards/testing-standards.md
