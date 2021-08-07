O desafio proposto mostra 3 produtos diferentes a serem lidados na aplicação. 

O Primeiro produto descrito como Pedra da sorte, para ser vendido, precisa de uma consulta de preços por região. Como descrito que os valores flutuam pouco dentro de um estado e muito dentro de uma cidade, existirão 3 níveis de localidade. Um cliente está em uma localidade da cidade, que está contida em uma cidade, que está contida em um estado. 

Portanto, podemos ter 3 preços bases para oferecer a um cliente, preço de localidade da cidade, preço da cidade e preço do estado. 

A lógica da negociação assumirá que o melhor cliente (maior TPV) da Pedregulho sempre será atendido por um vendedor muito experiente. Seria imprudente atender o melhor cliente com um vendedor inexperiente. 

Para acompanhar os 3 possíveis preços por localidade, haverão 3 níveis de experiência para um vendedor. O nível 1 de experiência sempre resultará no preço mínimo como sendo o mais caro dos 3, o nível 2 sendo o segundo mais caro e o nível 3 conseguirá o preço mais barato como o mínimo.

Seguindo no raciocínio, será calculado, a partir do cliente com o maior TPV, 3 níveis de clientes.

Na negociação, um cliente só entrará em acordo de pagar o preço mínimo calculado se sua oferta for menor ou igual a esse mínimo. Caso ele oferte um preço mais alto que o mínimo calculado, este será o preço que valerá para a venda do aluguel da pedra.

Clientes com baixo TPV ou em localidades com pouca demanda (menor preço de localidade) negociarão normalmente com um vendedor inexperiente. A intenção deste vendedor será vender o aluguel pelo maior preço de localidade possível e, caso consiga, poderá acumular experiência para subir de nível. Tais clientes podem negociar com vendedores experientes (para terem menores preços). Tal cenário aconteceria para garantir o máximo de vendas possível no competitivo mercado de pedras.
