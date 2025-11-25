# 🥋 Proyecto Base - Karate Framework

Proyecto base para el curso de automatización de pruebas API con Karate Framework.

## 📋 Requisitos Previos

- **Java JDK 11 o superior**
- **Apache Maven 3.6+**
- **IDE:** IntelliJ IDEA (recomendado) o VS Code

## 🚀 Inicio Rápido

### 1. Clonar el repositorio

```bash
git clone <url-del-repositorio>
cd karate-base-project
```

### 2. Verificar instalación de Java y Maven

```bash
java -version
mvn -version
```

### 3. Ejecutar los tests de ejemplo

```bash
mvn clean test
```

### 4. Ver el reporte

Abre en tu navegador:
```
target/karate-reports/karate-summary.html
```

## 📁 Estructura del Proyecto

```
karate-base-project/
├── pom.xml                          # Configuración Maven
├── README.md                        # Este archivo
└── src/test/
    ├── java/
    │   └── com/formacion/karate/
    │       ├── TestSuiteRunner.java      # Runner para todos los tests
    │       └── users/
    │           └── UsersRunner.java      # Runner específico de usuarios
    └── resources/
        ├── karate-config.js              # Configuración global
        ├── logback-test.xml              # Configuración de logs
        └── features/
            ├── users/
            │   ├── users.feature         # Tests de usuarios
            │   ├── user-schema.json      # Schema de validación
            │   └── user-payloads.json    # Datos de prueba
            └── common/
                └── health-check.feature  # Test de health check
```

