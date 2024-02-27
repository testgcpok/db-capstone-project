-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDM` ;

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customers` (
  `CustomersID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Contacts` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomersID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Time` TIME NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomersID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NULL DEFAULT NULL,
  `Role` VARCHAR(100) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `Contact_Number` INT NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Annual_Salary` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`MenuItems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL DEFAULT NULL,
  `Type` VARCHAR(100) NULL DEFAULT NULL,
  `Price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menus` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`, `ItemID`),
  INDEX `fk_MenuItems_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItems`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDM`.`MenuItems` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`DeliveryStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`DeliveryStatus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`DeliveryStatus` (
  `DeliveryStatusID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`DeliveryStatusID`),
  INDEX `fk_Staff_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Staff`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDM`.`Staff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `OrderID` INT NOT NULL,
  `TableNo` INT NOT NULL,
  `ItemID` INT NULL DEFAULT NULL,
  `BookingID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `TotalCost` DECIMAL NULL,
  `DeliveryStatusID` INT NULL,
  INDEX `fk_DeliveryStatus_idx` (`DeliveryStatusID` ASC) VISIBLE,
  INDEX `fk_ItemID_idx` (`ItemID` ASC) VISIBLE,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `fk_DeliveryStatus`
    FOREIGN KEY (`DeliveryStatusID`)
    REFERENCES `LittleLemonDM`.`DeliveryStatus` (`DeliveryStatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDM`.`MenuItems` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDM`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
