Feature: Calculadora
    Como um usuário da plataforma
    Desejo utilizar a Calculadora
    Para saber o resultado correto de alguns cálculos

    Background: Configuração de request url
        Given url "https://crud-api-academy.herokuapp.com/api/v1"
        And path "calculadora/soma"

    @ignore
    Scenario: Calcular dois números
        And request { num1: 5, num2: 4 }
        When method post
        Then status 200
        And match response == { resultado: 9 }

    @ignore
    Scenario: Caclular um número inteiro com um número decimal
        And request { num1: 2, num2: 3.5 }
        When method post
        Then status 200
        And match response == { resultado: 5.5 }

    @ignore
    Scenario: Caclular dois números decimais
        And request { num1: 0.4, num2: 8.2 }
        When method post
        Then status 200
        And match response == { resultado: 8.6 }

    Scenario Outline: Calcular <primeiroNumero> + <segundoNumero> = <resultado>
        # And request { num1: "#(primeiroNumero)", num2: "#(segundoNumero)" }
        And request ({ num1: primeiroNumero, num2: segundoNumero })
        When method post
        Then status 200
        # And match response == { resultado: "#(resultado)" }
        And match response == ({ resultado })

        Examples:
            | primeiroNumero! | segundoNumero! | resultado! | frutas  |
            | 5               | 4              | 9          | abacate |
            | 2               | 3.5            | 5.5        | morango |
            | 0.4             | 8.2            | 8.6        | banana  |

        