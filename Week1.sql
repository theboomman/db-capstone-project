-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NULL,
  `MobileNumber` INT NOT NULL,
  `E-Mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_Customers_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenusList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenusList` (
  `MenuID` INT NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  `starter` VARCHAR(45) NOT NULL,
  `courses` VARCHAR(45) NOT NULL,
  `drinks` VARCHAR(45) NOT NULL,
  `desserts` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `MenuID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_MenusList1_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Orders_Customers1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_MenusList1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`MenusList` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staffs` (
  `StaffID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderDeliveryStatus` (
  `OrderDeliveryStatusID` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`OrderDeliveryStatusID`),
  INDEX `fk_OrderDeliveryStatus_Orders1_idx` (`OrderID` ASC) VISIBLE,
  INDEX `fk_OrderDeliveryStatus_Staffs1_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDeliveryStatus_Orders1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDeliveryStatus_Staffs1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Staffs` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenuNames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenuNames` (
  `MenuNameID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuNameID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenusContent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenusContent` (
  `MenuID` INT NOT NULL,
  `MenuNameID` INT NOT NULL,
  INDEX `fk_MenuContent_MenusList1_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_MenuContent_MenuNames1_idx` (`MenuNameID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuContent_MenusList1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`MenusList` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MenuContent_MenuNames1`
    FOREIGN KEY (`MenuNameID`)
    REFERENCES `mydb`.`MenuNames` (`MenuNameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
