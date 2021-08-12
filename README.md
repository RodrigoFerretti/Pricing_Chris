# Pricing_Chris

O aplicação possui 3 produtos diferentes a serem vendidos. 

É necessário, para vender um produto, de uma consulta de preços por região. Como descrito que os valores flutuam pouco dentro de um estado e muito dentro de uma cidade, existirão 3 níveis de localidade. 

Um cliente está em uma localidade da cidade, que está contida em uma cidade, que está contida em um estado. 

Portanto, podemos ter 3 preços bases para utilizar no cálculo do preço mínimo, são eles:
- preço de localidade da cidade
- preço da cidade 
- preço do estado. 

Para acompanhar os 3 possíveis preços por localidade, haverão 3 níveis de experiência para um vendedor. O nível 1 de experiência sempre resultará no preço mínimo como sendo o mais caro dos 3 preços de localidade, o nível 2 sendo o segundo mais caro e o nível 3 conseguirá o preço mais barato de todos.

Seguindo no raciocínio, será calculado, a partir do cliente com o maior TPV, 3 níveis de clientes. Para toda negociação, existirá 3 possíveis preços, que estarão armazenados em uma lista ordenada do mais caro para o mais barato.

A lógica da negociação assumirá um nível a partir do maior nível entre cliente e vendedor. Se um vendedor do nível 3 negociar com um cliente nível 1, o nível da negociação será 3. Nessa situação, o cliente sempre possuirá um poder de barganha sobre o vendedor, e, caso um vendedor experiente ache importante fazer uma venda para um cliente com baixo nível, ele poderá fazer. Quanto maior o nível, menor o preço.

Na negociação, um cliente só entrará em acordo de pagar o preço mínimo calculado se sua oferta for menor ou igual a esse mínimo. Caso ele oferte um preço mais alto que o mínimo calculado, este será o preço que valerá para a venda do aluguel da pedra.

Clientes com baixo TPV ou em localidades com pouca demanda (menor preço de localidade) negociarão normalmente com um vendedor inexperiente. A intenção deste vendedor será vender o aluguel pelo maior preço de localidade possível e, caso consiga, poderá possivelmente acumular experiência para subir de nível (esta aplicação não contempla a lógica sobre níveis de vendedores). Tais clientes podem negociar com vendedores experientes também (para terem menores preços). Tal cenário aconteceria para garantir o máximo de vendas possível no competitivo mercado de pedras.

Clientes possuem também um segmento. O preço de um produto é definido pela combinação única de uma localidade e um segmento. Por exemplo, o produto 1 tem um preço para a localidade 1 e segmento 1, assim como um preço diferente para a localidade 1 e segmento 2 e assim sucesivamente.


O preço mínimo da negociação é definido a partir do nível da mesma. Se o nível da negociação for 1, será escolhido o primeiro item da lista de preços possíveis (o mais caro). Reforçando: o preço final será o preço oferecido se este for maior que o preço mínimo, caso contrário, será o preço mínimo. 

As regras de negócio de cada pedra estão aplicada no cálculo de receita. A promoção desconsidera o segmento do cliente e oferece o menor preço de todos os preços daquele produto naquela localidade. A promoção é valida para todos os clientes.


## Instalação

Instalando os pacotes da aplicação:

```cmd

> python -m pip install -r requirements.txt

```

Inicializando a aplicação:

```cmd

> python app.py

```

Testando a aplicação:

```cmd

> pyhton -m pytest .\tests\main.py

```

## Utilização

Depois de iniciar a aplicação, você poderá ver a documentação em swagger da api em:

```link

http://localhost:5000/api/docs

```

As rotas disponíveis para a aplicação são:
- /negotiation POST
- /promotion POST


Por praticidade, os clientes e vendedores terão 'id's de acordo com seus níveis. 

A api recebe o  payload no seguinte formato, em json:

```json
{
    "client_id": 1,
    "seller_id": 1,
    "product_id": 1,
    "price_offer": 1.80

}
```

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
```
