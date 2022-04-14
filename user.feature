Feature: Gestão de usuários 
    Como um gestor da Pet Store 
    Desejo gerenciar os usuários 
    Para ter o controle das informações cadastradas

    Background: Base url 
        Given url baseUrl
        And path "user"
        * def userNameUpdate = "elidag"
        * def primeiroNomeDoUsuario = "Lucas"
        * def payload = read("payloadCriacaoUsuario.json")
        * def userId = payload.id.toString()

    Scenario: Cadastrar um novo usuário
        And request payload
        When method post
        Then status 200
        # And match response contains { code, type, message }
        And match response contains { code: 200, type: "unknown", message: "#(userId)"}

    Scenario: Consultar usuário cadastrado pelo username
        And path payload.username
        When method get
        Then status 200
        And match response contains payload

    Scenario: Atualizar informações do usuário cadastrado
        # * def payloadAtualizado = { id: "#(payload.id)", username: "#(payload.username)", firstName: "Abacate" , lastName: "Doce", email: "#(payload.email)", password: "#(payload.password)", phone: "#(payload.phone)", userStatus: "#(payload.userStatus)" }
        * def payloadAtualizado = ({ ...payload, firstName: "Abacate", lastName: "Docinho" })
        And path payload.username
        And request payloadAtualizado
        When method put
        Then status 200

        Given path "user"
        And path payload.username
        When method get
        Then status 200
        And match response contains payloadAtualizado