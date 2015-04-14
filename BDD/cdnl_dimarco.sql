-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cdnl_dimarco
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cdnl_dimarco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cdnl_dimarco` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `cdnl_dimarco` ;

-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`oeuvre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`oeuvre` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`oeuvre` (
  `id_oeu` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  PRIMARY KEY (`id_oeu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`utilisateur` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`utilisateur` (
  `id_uti` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NULL,
  `mdp` VARCHAR(45) NULL,
  `age` VARCHAR(45) NULL,
  PRIMARY KEY (`id_uti`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`Prop oeuvres_has_Utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`Prop oeuvres_has_Utilisateur` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`Prop oeuvres_has_Utilisateur` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`prop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`prop` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`prop` (
  `Utilisateur_id` INT NOT NULL,
  `id_prop` INT NOT NULL,
  INDEX `fk_Utilisateur_has_Oeuvres_Utilisateur1_idx` (`Utilisateur_id` ASC),
  PRIMARY KEY (`id_prop`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`categorie` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`categorie` (
  `id_cat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `maj` DATETIME NULL,
  PRIMARY KEY (`id_cat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`tag` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`tag` (
  `id_tag` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `id_cat` INT NOT NULL,
  PRIMARY KEY (`id_tag`),
  INDEX `fk_tag_categorie1_idx` (`id_cat` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`commentaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`commentaire` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`commentaire` (
  `id_com` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(45) NULL,
  `contenu` VARCHAR(45) NULL,
  `id_uti` INT NULL,
  `id_oeu` INT NULL,
  PRIMARY KEY (`id_com`),
  INDEX `fk_commentaire_Utilisateur1_idx` (`id_uti` ASC),
  INDEX `fk_commentaire_Oeuvres1_idx` (`id_oeu` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`table1` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`oeuvres_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`oeuvres_tag` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`oeuvres_tag` (
  `id_oeuvre` INT NOT NULL,
  `id_tag` INT NOT NULL,
  `maj` DATETIME NULL,
  PRIMARY KEY (`id_oeuvre`, `id_tag`),
  INDEX `fk_Oeuvres_has_tag_tag1_idx` (`id_tag` ASC),
  INDEX `fk_Oeuvres_has_tag_Oeuvres1_idx` (`id_oeuvre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`fragment_oeuvre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`fragment_oeuvre` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`fragment_oeuvre` (
  `id_frag` INT NOT NULL,
  `id_oeu` INT NOT NULL,
  `x` VARCHAR(45) NULL,
  `y` VARCHAR(45) NULL,
  `w` VARCHAR(45) NULL,
  `h` VARCHAR(45) NULL,
  PRIMARY KEY (`id_frag`),
  INDEX `fk_fragment_oeuvre_Oeuvres1_idx` (`id_oeu` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdnl_dimarco`.`frag_tag_uti`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdnl_dimarco`.`frag_tag_uti` ;

CREATE TABLE IF NOT EXISTS `cdnl_dimarco`.`frag_tag_uti` (
  `id_tag` INT NOT NULL,
  `id_uti` INT NOT NULL,
  `id_frag` INT NOT NULL,
  `maj` DATETIME NULL,
  PRIMARY KEY (`id_tag`, `id_uti`, `id_frag`),
  INDEX `fk_tag_has_Utilisateur_Utilisateur1_idx` (`id_uti` ASC),
  INDEX `fk_tag_has_Utilisateur_tag1_idx` (`id_tag` ASC),
  INDEX `fk_tag_has_Utilisateur_fragment_oeuvre1_idx` (`id_frag` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
