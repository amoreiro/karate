# ⚡ Quick Start - 5 Minutos

## 1️⃣ Verificar Pre-requisitos (1 min)

```bash
java -version
# Debe mostrar: java version "11" o superior

mvn -version
# Debe mostrar: Apache Maven 3.x
```

---

## 2️⃣ Ejecutar tests (1 min)

```bash
cd karate-base-project

# Ejecutar tests
mvn clean test
```

✅ **Debes ver:** `BUILD SUCCESS`

---

## 3️⃣ Ver Reporte (1 min)

Abre en tu navegador:
```
target/karate-reports/karate-summary.html
```

✅ **Debes ver:** Reporte HTML con todos los tests pasando

---

## 4️⃣ Ejecutar desde el IDE (1 min)

### IntelliJ IDEA
1. Abrir proyecto
2. Click derecho en `TestSuiteRunner.java`
3. Run 'TestSuiteRunner'

### VS Code
1. Abrir proyecto
2. Terminal → `mvn test`

---

## ✅ ¡Listo!

Si llegaste aquí sin errores, tu entorno está configurado correctamente.

**Siguiente paso:** Lee el docuemnto completo y comienza con los ejercicios.

---

## 🆘 Problemas Comunes

| Problema | Solución |
|----------|----------|
| `mvn` no reconocido | Instala Maven y agrégalo al PATH |
| `java` no reconocido | Instala JDK 11+ y configura JAVA_HOME |
| Tests fallan | Verifica conexión a internet (usa API pública) |
| No se genera reporte | Ejecuta `mvn clean test` (no solo `mvn test`) |


**¿Aún tienes problemas?** Consulta con tu formador.
