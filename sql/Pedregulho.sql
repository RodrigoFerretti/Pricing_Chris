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
