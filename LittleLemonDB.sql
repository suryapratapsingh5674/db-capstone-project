-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lilltelemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lilltelemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lilltelemon` DEFAULT CHARACTER SET utf8 ;
USE `lilltelemon` ;

-- -----------------------------------------------------
-- Table `lilltelemon`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lilltelemon`.`Customers` (
  `customer_id` INT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lilltelemon`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lilltelemon`.`Bookings` (
  `booking_id` INT NULL AUTO_INCREMENT,
  `booking_date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customar_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customar_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lilltelemon`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lilltelemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lilltelemon`.`Menu` (
  `menu_id` INT NULL AUTO_INCREMENT,
  `category` ENUM('Starter', 'Course', 'Drink', 'Dessert') NOT NULL,
  `item_name` VARCHAR(100) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lilltelemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lilltelemon`.`Orders` (
  `order_id` INT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL(8,2) NOT NULL,
  `menu_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `menu_id_idx` (`menu_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `menu_id`
    FOREIGN KEY (`menu_id`)
    REFERENCES `lilltelemon`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lilltelemon`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lilltelemon`.`Order_Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lilltelemon`.`Order_Delivery_Status` (
  `delivery_id` INT NULL AUTO_INCREMENT,
  `order_id` INT NULL,
  `delivery_date` DATETIME NULL,
  `status` ENUM('Pending', 'Delivered', 'Cancelled') NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `lilltelemon`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lilltelemon`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lilltelemon`.`Staff` (
  `staff_id` INT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NOT NULL,
  `role` VARCHAR(50) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
