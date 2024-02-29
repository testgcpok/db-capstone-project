-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM_2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDM_2` ;

-- -----------------------------------------------------
-- Schema LittleLemonDM_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM_2` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM_2` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM_2`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM_2`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM_2`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(45) NULL,
  `ContactNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM_2`.`Menultems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM_2`.`Menultems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM_2`.`Menultems` (
  `MenultemsID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DesertName` VARCHAR(45) NULL,
  PRIMARY KEY (`MenultemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM_2`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM_2`.`Menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM_2`.`Menus` (
  `MenulD` INT NOT NULL,
  `MenultemsID` INT NULL,
  `MenuName` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenulD`),
  INDEX `FK_idx` (`MenultemsID` ASC) VISIBLE,
  CONSTRAINT `FK`
    FOREIGN KEY (`MenultemsID`)
    REFERENCES `LittleLemonDM_2`.`Menultems` (`MenultemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM_2`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM_2`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM_2`.`Orders` (
  `OrdersID` INT NOT NULL,
  `MenulD` INT NULL,
  `CustomerID` INT NULL,
  `TotalCost` DECIMAL NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrdersID`),
  INDEX `make_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `Include_idx` (`MenulD` ASC) VISIBLE,
  CONSTRAINT `Make`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM_2`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Include`
    FOREIGN KEY (`MenulD`)
    REFERENCES `LittleLemonDM_2`.`Menus` (`MenulD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
