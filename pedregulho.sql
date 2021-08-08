CREATE SCHEMA IF NOT EXISTS `pedregulho`  ;
USE `pedregulho` ;

-- -----------------------------------------------------
-- Table `pedregulho`.`Segment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`Segment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `taxes` DECIMAL(15, 2) NOT NULL,
  `fees` DECIMAL(15, 2) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `pedregulho`.`State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`State` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `pedregulho`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`City` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `city_state_id_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `city_state_id`
    FOREIGN KEY (`state_id`)
    REFERENCES `pedregulho`.`State` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `pedregulho`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`Location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_city_id_idx` (`city_id` ASC) VISIBLE,
  INDEX `location_state_id_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `location_city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `pedregulho`.`City` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_state_id`
    FOREIGN KEY (`state_id`)
    REFERENCES `pedregulho`.`State` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `pedregulho`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`Client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `tpv` DECIMAL(15, 2) NOT NULL,
  `segment_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_segment_id_idx` (`segment_id` ASC) VISIBLE,
  INDEX `client_location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `client_segment_id`
    FOREIGN KEY (`segment_id`)
    REFERENCES `pedregulho`.`Segment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `pedregulho`.`Location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `pedregulho`.`Seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`Seller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` INT NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `pedregulho`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `fabrication_costs` DECIMAL(15, 2) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `pedregulho`.`LocationPrice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`LocationPrice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(15, 2) NOT NULL,
  `transportation_price` DECIMAL(15, 2) NOT NULL,
  `product_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_price_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `location_price_location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `location_price_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pedregulho`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_price_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `pedregulho`.`Location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `pedregulho`.`CityPrice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`CityPrice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(15, 2) NOT NULL,
  `product_id` INT NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `city_price_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `city_price_city_id_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `city_price_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pedregulho`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `city_price_city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `pedregulho`.`City` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `pedregulho`.`StatePrice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedregulho`.`StatePrice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(15, 2) NOT NULL,
  `product_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `state_price_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `state_price_state_id_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `state_price_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `pedregulho`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `state_price_state_id`
    FOREIGN KEY (`state_id`)
    REFERENCES `pedregulho`.`State` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
