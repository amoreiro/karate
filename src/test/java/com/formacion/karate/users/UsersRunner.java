package com.formacion.karate.users;

import com.intuit.karate.junit5.Karate;

/**
 * Runner específico para tests de usuarios
 * 
 * Para ejecutar solo tests de usuarios:
 * mvn test -Dtest=UsersRunner
 * 
 * O desde el IDE: Click derecho -> Run 'UsersRunner'
 */
class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        // Ejecuta solo los features en la carpeta users
        return Karate.run("classpath:features/users");
    }

    @Karate.Test
    Karate testUsersWithTag() {
        // Ejecuta solo tests de usuarios con tag específico
        return Karate.run("classpath:features/users")
                .tags("@get");
    }

    @Karate.Test
    Karate testUsersExcludingExercises() {
        // Ejecuta tests de usuarios pero excluye ejercicios
        return Karate.run("classpath:features/users")
                .tags("~@exercise");
    }
}
