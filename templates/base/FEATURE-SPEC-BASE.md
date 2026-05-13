# TEMPLATE BASE - SPEC-DRIVEN DEVELOPMENT

Version: 3.0
Fecha: 12-05-2026
Estado: Activo

## 0) Politica obligatoria

1. Primero la especificacion.
2. Spec-anchored.
3. Spec-as-source.

Regla de control:
- Si falta un insumo critico del spec, NO inicia desarrollo.

## 1) Identificacion

- Feature ID: <FEATURE-ID>
- Nombre corto: <NOMBRE-FEATURE>
- Modulo: <MODULO>
- Tipo: <Nueva funcionalidad | Mejora | Bugfix>
- Prioridad: <Alta | Media | Baja>
- Responsable funcional: <NOMBRE>
- Responsable tecnico: <NOMBRE>
- Fecha de solicitud: <DD-MM-YYYY>
- Estado del spec: <Borrador | En revision | Aprobado>

## 2) Problema y objetivo

### 2.1 Problema
- Situacion actual:
- Impacto:
- Usuarios afectados:

### 2.2 Objetivo
- Resultado esperado:
- KPI:
- Meta KPI:

## 3) Alcance

### 3.1 En alcance
- RF-01:
- RF-02:
- RF-03:

### 3.2 Fuera de alcance
- N/A-01:
- N/A-02:

## 4) Requerimientos funcionales y reglas de negocio

### 4.1 RF
- RF-01:
- RF-02:
- RF-03:

### 4.2 RN
- RN-01:
- RN-02:
- RN-03:

## 5) Requerimientos no funcionales (estandar oficial)

- RNF-SEG-01: OWASP Top 10 + OWASP ASVS
- RNF-SEG-02: CWE Top 25
- RNF-CAL-01: Quality Gate de codigo
- RNF-DEP-01: CVE/NVD sin hallazgos criticos
- RNF-API-01: OpenAPI (si aplica)
- RNF-TST-01: Cobertura segun politica interna
- RNF-ACC-01 (si UI): WCAG 2.2 AA

Para cada RNF:
- Criterio medible:
- Evidencia esperada:
- Umbral:

## 6) Contratos tecnicos

### 6.1 API (si aplica)
- Endpoint:
- Metodo:
- Request:
- Response:
- HTTP esperados:

### 6.2 DTO/Eventos/Esquemas
- DTO-01:
- DTO-02:

### 6.3 Datos y dependencias
- DB/SP/scripts:
- Integraciones:
- Configuracion:

## 7) Criterios de aceptacion

- CA-01: Dado/Cuando/Entonces
- CA-02: Dado/Cuando/Entonces
- CA-03: Dado/Cuando/Entonces

## 8) Trazabilidad

| ID | Implementacion esperada | Prueba | Evidencia |
|---|---|---|---|
| RF-01 | | | |
| RF-02 | | | |
| RN-01 | | | |
| RNF-SEG-01 | | | |

## 9) Riesgos, supuestos y decisiones

### 9.1 Riesgos
- R-01:
- R-02:

### 9.2 Supuestos
- S-01:
- S-02:

### 9.3 Decisiones
- D-01:
- D-02:

## 10) Evidencia minima y cierre

- PR checklist
- Build
- Test
- Quality gate
- Seguridad
- Validacion funcional

Estado:
- Completa | Diferida (con plan)

## 11) GO/NO-GO para iniciar desarrollo

- [ ] Problema y objetivo definidos
- [ ] Alcance/no alcance cerrados
- [ ] RF y RN definidos
- [ ] RNF mapeados a estandar oficial
- [ ] Contratos tecnicos definidos
- [ ] CA verificables
- [ ] Trazabilidad inicial

Regla:
- Si algun item critico esta en NO, desarrollo bloqueado.

## 12) Control de cambios del spec

| Version | Fecha | Autor | Cambios | Aprobacion |
|---|---|---|---|---|
| 3.0 | 12-05-2026 | <AUTOR> | Base estandar SDD en directorio templates/base | <APROBADOR> |
