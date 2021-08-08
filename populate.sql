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

INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('1', '1.30', '40.00', '1', '1');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('2', '1.50', '30.00', '1', '2');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('3', '2.00', '20.00', '1', '3');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('4', '200.00', '40.00', '2', '1');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('5', '220.00', '30.00', '2', '2');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('6', '250.00', '20.00', '2', '3');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('7', '300.00', '40.00', '3', '1');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('8', '330.00', '30.00', '3', '2');
INSERT INTO `pedregulho`.`locationprice` (`id`, `price`, `transportation_price`, `product_id`, `location_id`) VALUES ('9', '350', '20.00', '3', '3');

INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('1', '1.40', '1', '1');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('2', '1.60', '1', '2');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('3', '2.10', '1', '3');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('4', '220.00', '2', '1');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('5', '240.00', '2', '2');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('6', '280.00', '2', '3');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('7', '330.00', '3', '1');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('8', '350.00', '3', '2');
INSERT INTO `pedregulho`.`cityprice` (`id`, `price`, `product_id`, `city_id`) VALUES ('9', '380', '3', '3');

INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('1', '1.25', '1', '1');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('2', '1.55', '1', '2');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('3', '2.05', '1', '3');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('4', '215.00', '2', '1');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('5', '235.00', '2', '2');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('6', '275.00', '2', '3');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('7', '315.00', '3', '1');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('8', '335.00', '3', '2');
INSERT INTO `pedregulho`.`stateprice` (`id`, `price`, `product_id`, `state_id`) VALUES ('9', '365', '3', '3');

INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('1', 'Seller 1', '1');
INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('2', 'Seller 2', '2');
INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('3', 'Seller 3', '3');
