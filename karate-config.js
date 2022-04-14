function setup() {
    var ambiente = karate.env;

    var config = {}

    if(ambiente == "dev") {
        config.baseUrl = "https://petstore.swagger.io/v2"
    } else {
        config.baseUrl = "https://petstore.swagger.io/v1"
    }

    karate.configure("headers", {
        senha: "senha-1234",
        apiKey: 131415
    });

    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);

    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
    // karate.configure('proxy', 'http://my.proxy.host:8080');
    return config;
}