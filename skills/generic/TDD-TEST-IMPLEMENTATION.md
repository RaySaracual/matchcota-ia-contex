# Skill - TDD Test Implementation

Objetivo: implementar pruebas con TDD (Red-Green-Refactor) para reducir regresiones y mejorar diseno de codigo.

## Cuando usar este skill

- Nuevo feature con reglas de negocio.
- Bugfix con riesgo de reintroduccion.
- Refactor donde se quiere seguridad por tests.

## Entradas minimas

1. Spec del comportamiento esperado.
2. Criterios de aceptacion verificables.
3. Stack y framework de pruebas del proyecto.

## Flujo obligatorio TDD

1. Red
- Escribir primero una prueba que falle por comportamiento faltante.
- El nombre del test debe describir la regla de negocio.

2. Green
- Implementar el minimo codigo para pasar la prueba.
- Evitar optimizaciones prematuras.

3. Refactor
- Limpiar codigo y tests sin cambiar comportamiento.
- Mantener el suite en verde despues de cada cambio.

## Reglas de calidad

- Una prueba, una intencion clara.
- Evitar mocks innecesarios; preferir doubles simples.
- Probar comportamiento observable, no detalles internos.
- Cubrir caminos: feliz, validaciones, errores y bordes.
- Tests deterministas: sin dependencia de hora/red/estado global.

## Estrategia por capas

- Unit: logica pura y reglas de negocio.
- Integracion: frontera con servicios/repositorios/API.
- E2E (si aplica): flujo critico del usuario.

## Convenciones recomendadas

- Patron Given-When-Then en nombres y estructura.
- Datos de prueba explicitos y pequenos.
- Factory/builder para objetos complejos.

## Checklist de aceptacion

1. Existe al menos un test rojo inicial por requisito clave.
2. Cada requisito funcional tiene prueba asociada.
3. No hay tests flaky detectados en corrida local repetida.
4. Casos de error y borde estan cubiertos.
5. Refactor realizado con suite en verde.

## Formato de salida del agente

1. Tests agregados/actualizados.
2. Resultado de ejecucion (pass/fail).
3. Cobertura impactada (si hay metrica disponible).
4. Riesgos residuales y huecos de prueba.

## Criterio de salida

- Suite relevante en verde.
- Requisitos criticos cubiertos por pruebas.
- Cambios listos para revision.