function fn() {
    // Obtener el entorno (se puede pasar con -Dkarate.env=qa)
    var env = karate.env || 'dev';
    karate.log('===============================================');
    karate.log('Entorno de ejecución:', env);
    karate.log('===============================================');

    karate.configure('ssl', true);
    karate.configure('headers', { 'x-api-key': 'reqres-free-v1'});

    // Configuración común a todos los entornos
    var config = {
        appName: 'Karate Base Project',
        version: '1.0',
        
        // Configuración de timeouts
        waitTime: 5000,
        retryCount: 3,
        
        // Headers comunes
        commonHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };

    // Configuración específica por entorno
    if (env === 'dev') {
        config.baseUrl = 'https://reqres.in/api';
        config.apiTimeout = 5000;
        karate.configure('connectTimeout', 5000);
        karate.configure('readTimeout', 5000);
    } 
    else if (env === 'qa') {
        config.baseUrl = 'https://reqres.in/api';
        config.apiTimeout = 10000;
        karate.configure('connectTimeout', 10000);
        karate.configure('readTimeout', 10000);
    } 
    else if (env === 'prod') {
        config.baseUrl = 'https://reqres.in/api';
        config.apiTimeout = 15000;
        karate.configure('connectTimeout', 15000);
        karate.configure('readTimeout', 15000);
    }

    // Configuración de SSL (útil para entornos corporativos)
    // karate.configure('ssl', true);

    // Configuración de retry para requests
    // karate.configure('retry', { count: 3, interval: 5000 });

    karate.log('Base URL:', config.baseUrl);
    
    return config;
}
