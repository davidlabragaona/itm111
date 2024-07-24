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
-- Table `mydb`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`country` (
  `country_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB
COMMENT = '						';


-- -----------------------------------------------------
-- Table `mydb`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artist` (
  `artist_id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `mname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `dod` DATE NULL,
  `local` TINYINT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`artist_id`),
  INDEX `fk_artist_country_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `mydb`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`period`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`period` (
  `period_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`period_id`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `type_id` INT NOT NULL,
  `period` VARCHAR(45) NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paint` (
  `paint_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `year` INT NULL,
  `type` INT NULL,
  `file` VARCHAR(45) NULL,
  `period_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`paint_id`, `artist_id`),
  INDEX `fk_paint_period1_idx` (`period_id` ASC) VISIBLE,
  INDEX `fk_paint_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_paint_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_paint_period1`
    FOREIGN KEY (`period_id`)
    REFERENCES `mydb`.`period` (`period_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paint_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `mydb`.`type` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paint_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `mydb`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`keyword` (
  `keyword_id` INT NOT NULL,
  `keyword` VARCHAR(45) NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paint_keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paint_keyword` (
  `paint_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`paint_id`, `keyword_id`),
  INDEX `fk_paint_has_keyword_keyword1_idx` (`keyword_id` ASC) VISIBLE,
  INDEX `fk_paint_has_keyword_paint1_idx` (`paint_id` ASC) VISIBLE,
  CONSTRAINT `fk_paint_has_keyword_paint1`
    FOREIGN KEY (`paint_id`)
    REFERENCES `mydb`.`paint` (`paint_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paint_has_keyword_keyword1`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `mydb`.`keyword` (`keyword_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO country
( name )
VALUES
	('France'),
    ('Netherlands'),
    ('Italy'),
    ('United States of America'),
    ('Spain');
    
INSERT INTO period
(period)
VALUES
	('Impressionism'),
    ('Post-Impressionism'),
    ('Baroque'),
    ('Dutch Golden Age'),
    ('High Renaissance'),
    ('Renaissance'),
    ('Modern');
    
INSERT INTO type
	(type)
VALUES
	('Oil'),
    ('Tempra'),
    ('Waterpolo');
    
INSERT INTO keyword
(keyword)
VALUES
	('flowers'),
    ('Blue'),
    ('Landscape'),
    ('girl'),
    ('people'),
    ('Christ');
