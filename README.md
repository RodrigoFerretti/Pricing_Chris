# Pricing_Chris

O aplicação possui 3 produtos diferentes a serem vendidos. 

É necessário, para vender um produto, de uma consulta de preços por região. Como descrito que os valores flutuam pouco dentro de um estado e muito dentro de uma cidade, existirão 3 níveis de localidade. Um cliente está em uma localidade da cidade, que está contida em uma cidade, que está contida em um estado. 

Portanto, podemos ter 3 preços bases para utilizar no cálculo do preço mínimo, são eles:
- preço de localidade da cidade
- preço da cidade 
- preço do estado. 

Para acompanhar os 3 possíveis preços por localidade, haverão 3 níveis de experiência para um vendedor. O nível 1 de experiência sempre resultará no preço mínimo como sendo o mais caro dos 3 preços de localidade, o nível 2 sendo o segundo mais caro e o nível 3 conseguirá o preço mais barato de todos.

Seguindo no raciocínio, será calculado, a partir do cliente com o maior TPV, 3 níveis de clientes.

A lógica da negociação assumirá que o melhor cliente (maior TPV) da Pedregulho sempre será atendido por um vendedor muito experiente. Seria imprudente atender o melhor cliente com um vendedor inexperiente. Mas, caso o cliente nivel 3 seja atendido por um vendedor do nível 2 ou do nível 1, o que valerá será o preço referente ao nível 3, que é o mais barato.

Na negociação, um cliente só entrará em acordo de pagar o preço mínimo calculado se sua oferta for menor ou igual a esse mínimo. Caso ele oferte um preço mais alto que o mínimo calculado, este será o preço que valerá para a venda do aluguel da pedra.

Clientes com baixo TPV ou em localidades com pouca demanda (menor preço de localidade) negociarão normalmente com um vendedor inexperiente. A intenção deste vendedor será vender o aluguel pelo maior preço de localidade possível e, caso consiga, poderá possivelmente acumular experiência para subir de nível. Tais clientes podem negociar com vendedores experientes (para terem menores preços). Tal cenário aconteceria para garantir o máximo de vendas possível no competitivo mercado de pedras.

O nível da negociação é definido pelo maior nível entre o vendedor e o cliente. Quanto maior o nível, menor o preço.

Para toda negociação, existirá 3 possíveis preços, que estarão armazenados em uma lista ordenada do mais caro para o mais barato.

O preço mínimo da negociação é definido a partir do nível da mesma. Se o nível da negociação for 1, será escolhido o primeiro item da lista de preços possíveis (o mais caro). 

O preço final será o preço oferecido se este for maior que o preço mínimo, caso contrário, será o preço mínimo. 

As regras de negócio de cada pedra estão aplicada no cálculo de revenue.

A promoção desconsidera o segmento do cliente e oferece o menor preço de todos os preços daquele produto naquela localidade. A promoção é valida para todos os clientes.

Por praticidade, os clientes e vendedores terão 'id's de acordo com seus níveis. A api recebe o seguinte payload, em json:

```json
{
    "client_id": 1,
    "seller_id": 1,
    "product_id": 1,
    "price_offer": 1.80

}
``

e responderá, para este mesmo caso:

```json
{
    "price_offer_is_higher_than_minimum": true,
    "pnl": {
        "revenue": "R$ 180.00",
        "expenses": "R$ 74.25",
        "expenses_percentage": "41%",
        "profit": "R$ 105.75",
        "profit_percentage": "59%"
    }
}
``

