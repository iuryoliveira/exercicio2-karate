function setup() {
    var ambiente = karate.env;

    if(ambiente === "dev") {
        //ambiente é igual à "dev"
        karate.configure("logPrettyRequest", true);
        karate.configure("logPrettyResponse", true);
    }

    karate.configure("headers", {
        operador: "Iury",
        framework: "Karate"
    });

    karate.configure("readTimeout", 40000);

    var config = {
        baseUrl: "https://petstore.swagger.io/v2"
    }

    return config;
}