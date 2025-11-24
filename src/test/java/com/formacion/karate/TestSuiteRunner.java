package com.formacion.karate;

import com.intuit.karate.junit5.Karate;

/**
 * Runner principal que ejecuta TODOS los tests del proyecto
 * 
 * Para ejecutar:
 * mvn test
 * 
 * O desde el IDE: Click derecho -> Run 'TestSuiteRunner'
 */
class TestSuiteRunner {

    @Karate.Test
    Karate testAll() {
        // Ejecuta todos los .feature en src/test/resources/features
        return Karate.run("classpath:features");
    }

    @Karate.Test
    Karate testSmokeOnly() {
        // Ejecuta solo tests con tag @smoke
        return Karate.run("classpath:features")
                .tags("@smoke");
    }
}
