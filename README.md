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

## 🎯 Ejercicios del Curso

### ✅ Ejercicio 1: Setup y Verificación
**Objetivo:** Verificar que tu entorno está configurado correctamente

**Completado cuando:**
- Los tests de ejemplo ejecutan sin errores
- El reporte HTML se genera correctamente
- Puedes ejecutar tests individuales desde el IDE

**Comandos:**
```bash
mvn clean test
# Verifica que veas: BUILD SUCCESS
```

---

### 📝 Ejercicio 2: CRUD de Usuarios
**Objetivo:** Completar los escenarios de prueba de la API de usuarios

**Tareas:**
1. Abre `src/test/resources/features/users/users.feature`
2. Busca el escenario marcado con `@exercise @ignore`
3. Implementa un flujo completo que:
   - Cree un usuario
   - Lo actualice
   - Lo elimine
   - Verifique que ya no existe (404)

**Pistas:**
- Usa `* def userId = response.id` para guardar el ID
- Usa `Given path '/users/' + userId` para usar el ID guardado
- Quita el tag `@ignore` cuando esté listo para ejecutar

---

### 🚀 Ejercicio 3: Crear tu propio módulo
**Objetivo:** Aplicar lo aprendido creando un nuevo módulo de tests

**Tareas:**
1. Crear carpeta `src/test/resources/features/posts/`
2. Crear `posts.feature` para testear la API de posts
3. Crear `PostsRunner.java` en el paquete correspondiente
4. Implementar al menos 3 escenarios (GET, POST, DELETE)

**API Sugerida:** https://reqres.in/api/posts (o similar)

## 🔧 Comandos Útiles

```bash
# Ejecutar todos los tests
mvn clean test

# Ejecutar solo tests de usuarios
mvn test -Dtest=UsersRunner

# Ejecutar en entorno QA
mvn test -Dkarate.env=qa

# Ejecutar solo tests con tag @smoke
mvn test -Dkarate.options="--tags @smoke"

# Ejecutar excluyendo ejercicios
mvn test -Dkarate.options="--tags ~@exercise"

# Limpiar reportes anteriores
mvn clean

# Ver versión de dependencias
mvn dependency:tree
```

## 🎨 Trabajar con el IDE

### IntelliJ IDEA (Recomendado)

1. **Instalar plugin:**
   - File → Settings → Plugins
   - Buscar "Karate"
   - Instalar y reiniciar

2. **Ejecutar un feature:**
   - Click derecho en el archivo .feature → Run

3. **Ejecutar un runner:**
   - Click derecho en TestSuiteRunner.java → Run

4. **Debug:**
   - Click izquierdo del número de línea para breakpoint
   - Click derecho → Debug

### VS Code

1. **Instalar extensiones:**
   - Extension Pack for Java
   - Cucumber (Gherkin) Full Support

2. **Ejecutar:**
   - Usar terminal integrada: `mvn test`

## 📚 Recursos

- [Documentación oficial Karate](https://karatelabs.github.io/karate/)
- [GitHub Karate](https://github.com/karatelabs/karate)
- [API de prueba: ReqRes](https://reqres.in/)
- [Sintaxis Gherkin](https://cucumber.io/docs/gherkin/)

## 🐛 Solución de Problemas

### "java.lang.ClassNotFoundException: com.intuit.karate"
```bash
mvn clean install
```

### Los tests no encuentran los archivos .feature
- Verifica que estás ejecutando desde la raíz del proyecto
- Ejecuta: `mvn clean test` (no solo `mvn test`)

### Error: "No tests found"
- Verifica que tu clase Runner termina en `*Runner.java`
- Verifica que el método tiene la anotación `@Karate.Test`

### Proxy corporativo bloquea descarga de dependencias
Crea/edita el archivo `~/.m2/settings.xml`:
```xml
<settings>
  <proxies>
    <proxy>
      <active>true</active>
      <protocol>http</protocol>
      <host>proxy.tuempresa.com</host>
      <port>8080</port>
      <username>tu_usuario</username>
      <password>tu_password</password>
    </proxy>
  </proxies>
</settings>
```

### Los reportes no se generan
```bash
# Asegúrate de que el directorio existe
mkdir -p target/karate-reports

# Ejecuta con verbose para ver detalles
mvn clean test -X
```

## ✅ Verificación del Entorno

Ejecuta este comando para verificar que todo funciona:

```bash
mvn clean test -Dtest=TestSuiteRunner
```

**Resultado esperado:**
```
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running com.formacion.karate.TestSuiteRunner
...
[INFO] Tests run: 10, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] BUILD SUCCESS
```

## 📊 Interpretar el Reporte

El reporte HTML (`target/karate-reports/karate-summary.html`) muestra:

- ✅ **Passed:** Tests exitosos
- ❌ **Failed:** Tests fallidos (con detalles del error)
- ⏭️ **Skipped:** Tests con tag `@ignore`

Para cada test verás:
- Request completo (URL, headers, body)
- Response completo (status, headers, body)
- Tiempo de ejecución
- Stack trace si hubo error

## 🎓 Tips para el Curso

1. **Ejecuta los tests frecuentemente** - No esperes a escribir todo
2. **Lee los errores cuidadosamente** - Karate da mensajes muy descriptivos
3. **Usa print statements** - `And print 'valor:', variable` para debug
4. **Experimenta** - Cambia valores y ve qué pasa
5. **Consulta la documentación** - Está muy completa

## 👥 Soporte

- **Durante el curso:** Consulta con tu formador
- **Después del curso:** 
  - Stack Overflow tag [karate]
  - GitHub Issues del proyecto Karate
  - Documentación oficial

## 📝 Notas Adicionales

### Tags Disponibles

- `@smoke` - Tests básicos de sanidad
- `@users` - Tests del módulo de usuarios
- `@get`, `@post`, `@put`, `@delete` - Por tipo de método HTTP
- `@exercise` - Ejercicios para completar
- `@ignore` - Tests que no se ejecutan

### Convenciones del Proyecto

- Los features van en `src/test/resources/features/`
- Los runners van en `src/test/java/` siguiendo la estructura de packages
- Los datos de prueba en archivos `.json` junto a los `.feature`
- Los schemas de validación con sufijo `-schema.json`

---

**¡Mucha suerte con el curso! 🚀**

Si encuentras algún problema, no dudes en consultar con el formador.
