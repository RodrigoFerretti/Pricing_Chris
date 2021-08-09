INSERT INTO `pedregulho`.`segment` (`id`, `name`, `taxes`, `fees`) VALUES ('1', 'clothing', '0.02', '50.00');
INSERT INTO `pedregulho`.`segment` (`id`, `name`, `taxes`, `fees`) VALUES ('2', 'health', '0.03', '70.00');
INSERT INTO `pedregulho`.`segment` (`id`, `name`, `taxes`, `fees`) VALUES ('3', 'food', '0.05', '100.00');

INSERT INTO `pedregulho`.`state` (`id`, `name`) VALUES ('1', 'Santa Catarina');
INSERT INTO `pedregulho`.`state` (`id`, `name`) VALUES ('2', 'Rio de Janeiro');
INSERT INTO `pedregulho`.`state` (`id`, `name`) VALUES ('3', 'São Paulo');

INSERT INTO `pedregulho`.`city` (`id`, `name`, `state_id`) VALUES ('1', 'Florianópolis', '1');
INSERT INTO `pedregulho`.`city` (`id`, `name`, `state_id`) VALUES ('2', 'Rio de Janeiro', '2');
INSERT INTO `pedregulho`.`city` (`id`, `name`, `state_id`) VALUES ('3', 'São Paulo', '3');

INSERT INTO `pedregulho`.`location` (`id`, `name`, `city_id`, `state_id`) VALUES ('1', 'Capoeiras', '1', '1');
INSERT INTO `pedregulho`.`location` (`id`, `name`, `city_id`, `state_id`) VALUES ('2', 'Botafogo', '2', '2');
INSERT INTO `pedregulho`.`location` (`id`, `name`, `city_id`, `state_id`) VALUES ('3', 'Ibirapuera', '3', '3');

INSERT INTO `pedregulho`.`client` (`id`, `name`, `tpv`, `segment_id`, `location_id`) VALUES ('1', 'Client 1', '1000.00', '1', '1');
INSERT INTO `pedregulho`.`client` (`id`, `name`, `tpv`, `segment_id`, `location_id`) VALUES ('2', 'Client 2', '4000.00', '2', '2');
INSERT INTO `pedregulho`.`client` (`id`, `name`, `tpv`, `segment_id`, `location_id`) VALUES ('3', 'Client 3', '9000.00', '3', '3');

INSERT INTO `pedregulho`.`product` (`id`, `name`, `fabrication_costs`) VALUES ('1', 'Pedra Fofa', '150.00');
INSERT INTO `pedregulho`.`product` (`id`, `name`, `fabrication_costs`) VALUES ('2', 'Pedra Roxa', '200.00');
INSERT INTO `pedregulho`.`product` (`id`, `name`, `fabrication_costs`) VALUES ('3', 'Pedra da Sorte', '400.00');

INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('1', '1', '001.30', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('1', '2', '001.50', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('1', '3', '002.00', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('2', '1', '200.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('2', '2', '220.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('2', '3', '250.00', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('3', '1', '300.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('3', '2', '330.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `price`, `transportation_price`) VALUES ('3', '3', '350.00', '20.00');

INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('1', '2', '001.60');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('1', '3', '002.10');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('1', '1', '001.40');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('2', '1', '220.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('2', '2', '240.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('2', '3', '280.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('3', '1', '330.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('3', '2', '350.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `price`) VALUES ('3', '3', '380.00');

INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('1', '1', '001.25');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('1', '2', '001.55');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('1', '3', '002.05');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('2', '1', '215.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('2', '2', '235.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('2', '3', '275.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('3', '1', '315.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('3', '2', '335.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `price`) VALUES ('3', '3', '365.00');

INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('1', 'Seller 1', '1');
INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('2', 'Seller 2', '2');
INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('3', 'Seller 3', '3');
