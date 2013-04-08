SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mageclean` DEFAULT CHARACTER SET latin1 ;
USE `mageclean` ;

-- -----------------------------------------------------
-- Table `mageclean`.`exercise`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `exercisecol` VARCHAR(45) NULL ,
  `exercisecol1` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user_id` (`user_id` ASC) ,
  CONSTRAINT `exercise_ibfk_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mageclean`.`customer_entity` (`entity_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 157
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_requirement`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_requirement` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `exercise_id` INT(10) NULL DEFAULT NULL ,
  `short_text` TEXT NULL DEFAULT NULL ,
  `suggestion` TEXT NULL DEFAULT NULL ,
  `product_id` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `category_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `exercise_id` (`exercise_id` ASC) ,
  INDEX `product_id` (`product_id` ASC) ,
  CONSTRAINT `exercise_requirement_ibfk_1`
    FOREIGN KEY (`exercise_id` )
    REFERENCES `mageclean`.`exercise` (`id` ),
  CONSTRAINT `exercise_requirement_ibfk_2`
    FOREIGN KEY (`product_id` )
    REFERENCES `mageclean`.`catalog_product_entity` (`entity_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_requirement_categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_requirement_categories` (
  `requirement_id` INT(11) NOT NULL ,
  `category_id` INT(11) NOT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_suggestion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_suggestion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `exercise_id` INT(10) NULL DEFAULT NULL ,
  `short_text` TEXT NULL DEFAULT NULL ,
  `suggestion` TEXT NULL DEFAULT NULL ,
  `blog_id` INT(11) UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `exercise_id` (`exercise_id` ASC) ,
  INDEX `blog_id` (`blog_id` ASC) ,
  CONSTRAINT `exercise_suggestion_ibfk_1`
    FOREIGN KEY (`exercise_id` )
    REFERENCES `mageclean`.`exercise` (`id` ),
  CONSTRAINT `exercise_suggestion_ibfk_2`
    FOREIGN KEY (`blog_id` )
    REFERENCES `mageclean`.`aw_blog` (`post_id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_test`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_test` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user_id` (`user_id` ASC) ,
  INDEX `index3` (`user_id` ASC, `created_at` ASC) ,
  CONSTRAINT `exercise_test_ibfk_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mageclean`.`customer_entity` (`entity_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_vid`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_vid` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `exercise_id` INT(10) NULL DEFAULT NULL ,
  `vid_id` VARCHAR(255) NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `exercise_id` (`exercise_id` ASC) ,
  CONSTRAINT `exercise_vid_ibfk_1`
    FOREIGN KEY (`exercise_id` )
    REFERENCES `mageclean`.`exercise` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mageclean`.`routine`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`routine` (
  `fuck` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(10) UNSIGNED NOT NULL ,
  `name` VARCHAR(256) NOT NULL ,
  `round_time` INT(5) NOT NULL ,
  `round_rest` INT(5) NOT NULL ,
  `circuits` INT(5) NOT NULL ,
  `circuit_rest` INT(5) NOT NULL ,
  PRIMARY KEY (`fuck`) ,
  INDEX `user_id` (`user_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mageclean`.`routine_exercise`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`routine_exercise` (
  `id` INT(11) NOT NULL ,
  `routine_id` INT(11) NOT NULL ,
  `exercise_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mageclean`.`table1`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mageclean`.`review`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`review` (
  `review_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review id' ,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Review create date' ,
  `entity_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity id' ,
  `entity_pk_value` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id' ,
  `status_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status code' ,
  PRIMARY KEY (`review_id`) ,
  INDEX `IDX_REVIEW_ENTITY_ID` (`entity_id` ASC) ,
  INDEX `IDX_REVIEW_STATUS_ID` (`status_id` ASC) ,
  INDEX `IDX_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value` ASC) ,
  CONSTRAINT `FK_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID`
    FOREIGN KEY (`entity_id` )
    REFERENCES `mageclean`.`review_entity` (`entity_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID`
    FOREIGN KEY (`status_id` )
    REFERENCES `mageclean`.`review_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 115
DEFAULT CHARACTER SET = utf8
COMMENT = 'Review base information';

USE `mageclean` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
