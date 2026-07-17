Documento de Diseño de Software (SDD)

Proyecto: Matchcota (MVP)
Versión: 1.0.0
Rol Principal: CTO / Liderazgo Técnico

1. Introducción

1.1 Propósito

Este documento define la arquitectura de software, las decisiones de diseño técnico y la estructura de componentes para el Producto Mínimo Viable (MVP) de "Matchcota", una aplicación móvil de conexión e interacción para dueños de perros basada en geolocalización.

1.2 Alcance del MVP

El sistema permitirá el registro de usuarios, creación de perfiles caninos (fotos/video), descubrimiento geolocalizado mediante tarjetas (Swipe), y mensajería en tiempo real tras un "Match" mutuo.

2. Arquitectura del Sistema

El sistema sigue una arquitectura cliente-servidor clásica de tres capas.

Capa de Presentación (Frontend): Aplicación móvil multiplataforma desarrollada en Flutter.

Capa Lógica (Backend): API RESTful desarrollada en .NET 8 (C#).

Capa de Datos: Base de datos relacional PostgreSQL con la extensión PostGIS para consultas geoespaciales.

Almacenamiento Multimedia: Bucket en la nube (AWS S3 o Firebase Storage) para almacenar imágenes y videos de los perfiles.

3. Diseño del Frontend (Móvil - Flutter)

3.1 Tecnologías y Librerías Core

Framework: Flutter (Dart).

Gestión de Estado: Riverpod (recomendado para escalabilidad) o BLoC.

Navegación: GoRouter (para manejo de enlaces profundos y rutas declarativas).

Geolocalización: geolocator (paquete oficial).

Animaciones de Swipe: swipe_cards o creación de widget personalizado con GestureDetector.

3.2 Estructura de Carpetas Sugerida (Feature-First)

lib/
 ├── core/              # Configuraciones, temas (colores Matchcota), utilidades compartidas.
 │    ├── theme/
 │    └── network/      # Cliente HTTP (Dio/http).
 ├── features/          # Módulos principales de la app.
 │    ├── auth/         # Login (Apple, Google).
 │    ├── profile/      # Creación y edición de perro.
 │    ├── discovery/    # Pantalla principal (El Swipe).
 │    └── chat/         # Lista de matches y mensajería.
 └── main.dart          # Punto de entrada.


4. Diseño del Backend (API - .NET 8)

4.1 Tecnologías y Arquitectura

Framework: ASP.NET Core Web API (.NET 8).

ORM: Entity Framework Core (EF Core) con Npgsql (PostgreSQL provider).

Arquitectura: N-Tier simplificada (Controladores -> Servicios -> Repositorios).

Autenticación: JWT (JSON Web Tokens).

4.2 Estructura del Proyecto (.NET)

Matchcota.Api/             # Controladores y configuración de Swagger.
Matchcota.Core/            # Entidades de dominio (User, Dog, Match, Message), Interfaces.
Matchcota.Infrastructure/  # DbContext de EF Core, Implementación de repositorios, integración S3.
Matchcota.Services/        # Lógica de negocio (DiscoveryService, MatchService, Auth).


4.3 Lógica Crítica (Motor Geoespacial)

La búsqueda de perros cercanos (GET /api/discover) utilizará PostGIS (ST_DWithin) para comparar la coordenada Point del usuario actual con los registros de la tabla Dogs, filtrando aquellos cuyo id ya exista en la tabla Swipes para el usuario actual.

5. Diseño de Base de Datos

Se utilizará PostgreSQL. El esquema detallado se encuentra en el documento anexo de Modelo de BD.

Tablas Principales: Users, Dogs, DogMedia, Swipes, Matches, Messages.

Índices Críticos: Índice espacial (GIST) en la columna location de la tabla Dogs para asegurar consultas ultrarrápidas.

6. Seguridad y Privacidad

Autenticación API: Todas las rutas (excepto login/registro) estarán protegidas por [Authorize] exigiendo un token JWT válido.

Privacidad de Datos (Ubicación): La latitud/longitud exacta del usuario NUNCA se enviará al frontend de otros usuarios. El backend solo calculará y enviará la "distancia relativa" (ej. "a 3km de ti").

Cifrado: Contraseñas hasheadas con BCrypt/Argon2 (si se usa email/password) y comunicación forzada por HTTPS.

7. Despliegue e Infraestructura (Propuesta MVP)

Para mantener costos bajos y escalabilidad inicial:

Backend & DB: Contenedores Docker desplegados en un VPS económico (ej. DigitalOcean Droplet de $12-$24/mes) o AWS EC2 t3.micro.

Base de datos: Imagen de Docker postgis/postgis.

CI/CD: GitHub Actions para compilar la API y desplegar automáticamente en el servidor al hacer push a la rama main.