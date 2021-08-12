-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pedregulho
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pedregulho
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pedregulho` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pedregulho` ;

-- -----------------------------------------------------
-- Table `pedregulho`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `city_state_id_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `city_state_id`
    FOREIGN KEY (`state_id`)
    REFERENCES `pedregulho`.`state` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `fabrication_costs` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`segment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`segment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`cityprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`cityprice` (
  `product_id` INT NOT NULL,
  `city_id` INT NOT NULL,
  `segment_id` INT NOT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`product_id`, `city_id`, `segment_id`),
  INDEX `city_price_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `city_price_city_id_idx` (`city_id` ASC) VISIBLE,
  INDEX `city_price_segment_id_idx` (`segment_id` ASC) VISIBLE,
  CONSTRAINT `city_price_city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `pedregulho`.`city` (`id`),
  CONSTRAINT `city_price_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pedregulho`.`product` (`id`),
  CONSTRAINT `city_price_segment_id`
    FOREIGN KEY (`segment_id`)
    REFERENCES `pedregulho`.`segment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_city_id_idx` (`city_id` ASC) VISIBLE,
  INDEX `location_state_id_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `location_city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `pedregulho`.`city` (`id`),
  CONSTRAINT `location_state_id`
    FOREIGN KEY (`state_id`)
    REFERENCES `pedregulho`.`state` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `tpv` DECIMAL(15,2) NOT NULL,
  `segment_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_segment_id_idx` (`segment_id` ASC) VISIBLE,
  INDEX `client_location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `client_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `pedregulho`.`location` (`id`),
  CONSTRAINT `client_segment_id`
    FOREIGN KEY (`segment_id`)
    REFERENCES `pedregulho`.`segment` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`locationprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`locationprice` (
  `product_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `segment_id` INT NOT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  `transportation_price` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`product_id`, `location_id`, `segment_id`),
  INDEX `location_price_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `location_price_location_id_idx` (`location_id` ASC) VISIBLE,
  INDEX `location_price_segment_id_idx` (`segment_id` ASC) VISIBLE,
  CONSTRAINT `location_price_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `pedregulho`.`location` (`id`),
  CONSTRAINT `location_price_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pedregulho`.`product` (`id`),
  CONSTRAINT `location_price_segment_id`
    FOREIGN KEY (`segment_id`)
    REFERENCES `pedregulho`.`segment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`seller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedregulho`.`stateprice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`stateprice` (
  `product_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  `segment_id` INT NOT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`product_id`, `state_id`, `segment_id`),
  INDEX `state_price_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `state_price_state_id_idx` (`state_id` ASC) VISIBLE,
  INDEX `state_price_segment_id_idx` (`segment_id` ASC) VISIBLE,
  CONSTRAINT `state_price_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pedregulho`.`product` (`id`),
  CONSTRAINT `state_price_state_id`
    FOREIGN KEY (`state_id`)
    REFERENCES `pedregulho`.`state` (`id`),
  CONSTRAINT `state_price_segment_id`
    FOREIGN KEY (`segment_id`)
    REFERENCES `pedregulho`.`segment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `pedregulho`.`segment` (`id`, `name`) VALUES ('1', 'clothing');
INSERT INTO `pedregulho`.`segment` (`id`, `name`) VALUES ('2', 'health');
INSERT INTO `pedregulho`.`segment` (`id`, `name`) VALUES ('3', 'food');

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

INSERT INTO `pedregulho`.`product` (`id`, `name`, `fabrication_costs`) VALUES ('1', 'Pedra Fofa', '500.00');
INSERT INTO `pedregulho`.`product` (`id`, `name`, `fabrication_costs`) VALUES ('2', 'Pedra Roxa', '100.00');
INSERT INTO `pedregulho`.`product` (`id`, `name`, `fabrication_costs`) VALUES ('3', 'Pedra da Sorte', '1000.00');

INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '1', '1', '001.30', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '2', '1', '001.50', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '3', '1', '002.00', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '1', '1', '230.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '2', '1', '250.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '3', '1', '270.00', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '1', '1', '300.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '2', '1', '330.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '3', '1', '350.00', '20.00');

INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '1', '2', '001.40', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '2', '2', '001.60', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '3', '2', '002.10', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '1', '2', '235.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '2', '2', '245.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '3', '2', '275.00', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '1', '2', '310.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '2', '2', '340.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '3', '2', '360.00', '20.00');

INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '1', '3', '001.50', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '2', '3', '002.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('1', '3', '3', '002.20', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '1', '3', '245.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '2', '3', '265.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('2', '3', '3', '295.00', '20.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '1', '3', '320.00', '40.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '2', '3', '350.00', '30.00');
INSERT INTO `pedregulho`.`locationprice` (`product_id`, `location_id`, `segment_id`, `price`, `transportation_price`) VALUES ('3', '3', '3', '370.00', '20.00');

INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '2', '1', '001.60');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '3', '1', '002.10');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '1', '1', '001.40');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '1', '1', '240.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '2', '1', '260.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '3', '1', '295.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '1', '1', '330.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '2', '1', '350.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '3', '1', '380.00');

INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '2', '2', '001.70');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '3', '2', '002.20');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '1', '2', '001.50');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '1', '2', '250.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '2', '2', '270.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '3', '2', '300.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '1', '2', '350.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '2', '2', '370.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '3', '2', '390.00');

INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '2', '3', '001.80');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '3', '3', '002.40');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('1', '1', '3', '001.90');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '1', '3', '2650.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '2', '3', '2750.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('2', '3', '3', '305.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '1', '3', '370.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '2', '3', '380.00');
INSERT INTO `pedregulho`.`cityprice` (`product_id`, `city_id`, `segment_id`, `price`) VALUES ('3', '3', '3', '395.00');

INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '1', '1', '001.25');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '2', '1', '001.55');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '3', '1', '002.05');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '1', '1', '245.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '2', '1', '265.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '3', '1', '295.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '1', '1', '315.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '2', '1', '335.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '3', '1', '365.00');

INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '1', '2', '001.35');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '2', '2', '001.65');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '3', '2', '002.15');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '1', '2', '255.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '2', '2', '275.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '3', '2', '315.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '1', '2', '325.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '2', '2', '345.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '3', '2', '375.00');

INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '1', '3', '001.45');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '2', '3', '001.75');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('1', '3', '3', '002.25');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '1', '3', '255.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '2', '3', '275.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('2', '3', '3', '305.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '1', '3', '335.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '2', '3', '355.00');
INSERT INTO `pedregulho`.`stateprice` (`product_id`, `state_id`, `segment_id`, `price`) VALUES ('3', '3', '3', '385.00');

INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('1', 'Seller 1', '1');
INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('2', 'Seller 2', '2');
INSERT INTO `pedregulho`.`seller` (`id`, `name`, `type`) VALUES ('3', 'Seller 3', '3');
