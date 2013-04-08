SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mymod` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE SCHEMA IF NOT EXISTS `mageclean` DEFAULT CHARACTER SET latin1 ;
USE `mymod` ;

-- -----------------------------------------------------
-- Table `mymod`.`states`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mymod`.`states` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `statescol` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymod`.`customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mymod`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customercol` VARCHAR(45) NULL ,
  `stateId` TINYINT UNSIGNED NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_customer_1_idx` (`stateId` ASC) ,
  CONSTRAINT `fk_customer_1`
    FOREIGN KEY (`stateId` )
    REFERENCES `mymod`.`states` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymod`.`table1`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mymod`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymod`.`table2`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mymod`.`table2` (
)
ENGINE = InnoDB;

USE `mageclean` ;

-- -----------------------------------------------------
-- Table `mageclean`.`exercise`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user_id` (`user_id` ASC) ,
  CONSTRAINT `exercise_ibfk_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mageclean`.`customer_entity` (`entity_id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 157
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_category` (
  `cat_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `identifier` VARCHAR(255) NULL DEFAULT NULL ,
  `sort_order` TINYINT(6) UNSIGNED NULL DEFAULT NULL ,
  `meta_keywords` TEXT NULL DEFAULT NULL ,
  `meta_description` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`cat_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mageclean`.`exercise_category_store`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_category_store` (
  `cat_id` INT(11) NULL DEFAULT NULL ,
  `store_id` SMALLINT(5) UNSIGNED NULL DEFAULT NULL ,
  INDEX `store_id` (`store_id` ASC) ,
  INDEX `cat_id` (`cat_id` ASC) ,
  CONSTRAINT `exercise_category_store_ibfk_1`
    FOREIGN KEY (`store_id` )
    REFERENCES `mageclean`.`core_store` (`store_id` ),
  CONSTRAINT `exercise_category_store_ibfk_2`
    FOREIGN KEY (`cat_id` )
    REFERENCES `mageclean`.`exercise_category` (`cat_id` ))
ENGINE = InnoDB
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
-- Table `mageclean`.`exercise_store`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`exercise_store` (
  `exercise_id` INT(10) NULL DEFAULT NULL ,
  `store_id` SMALLINT(5) UNSIGNED NULL DEFAULT NULL ,
  INDEX `store_id` (`store_id` ASC) ,
  INDEX `exercise_id` (`exercise_id` ASC) ,
  CONSTRAINT `exercise_store_ibfk_1`
    FOREIGN KEY (`store_id` )
    REFERENCES `mageclean`.`core_store` (`store_id` ),
  CONSTRAINT `exercise_store_ibfk_2`
    FOREIGN KEY (`exercise_id` )
    REFERENCES `mageclean`.`exercise` (`id` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  CONSTRAINT `exercise_test_ibfk_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mageclean`.`customer_entity` (`entity_id` ))
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
-- Table `mageclean`.`admin_assert`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`admin_assert` (
  `assert_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Assert ID' ,
  `assert_type` VARCHAR(20) NOT NULL COMMENT 'Assert Type' ,
  `assert_data` TEXT NULL DEFAULT NULL COMMENT 'Assert Data' ,
  PRIMARY KEY (`assert_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Admin Assert Table';


-- -----------------------------------------------------
-- Table `mageclean`.`admin_role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`admin_role` (
  `role_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role ID' ,
  `parent_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Role ID' ,
  `tree_level` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Tree Level' ,
  `sort_order` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Sort Order' ,
  `role_type` VARCHAR(1) NOT NULL DEFAULT '0' COMMENT 'Role Type' ,
  `user_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID' ,
  `role_name` VARCHAR(50) NOT NULL COMMENT 'Role Name' ,
  PRIMARY KEY (`role_id`) ,
  INDEX `IDX_ADMIN_ROLE_PARENT_ID_SORT_ORDER` (`parent_id` ASC, `sort_order` ASC) ,
  INDEX `IDX_ADMIN_ROLE_TREE_LEVEL` (`tree_level` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COMMENT = 'Admin Role Table';


-- -----------------------------------------------------
-- Table `mageclean`.`admin_rule`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`admin_rule` (
  `rule_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule ID' ,
  `role_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role ID' ,
  `resource_id` VARCHAR(255) NOT NULL COMMENT 'Resource ID' ,
  `privileges` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Privileges' ,
  `assert_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Assert ID' ,
  `role_type` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Role Type' ,
  `permission` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Permission' ,
  PRIMARY KEY (`rule_id`) ,
  INDEX `IDX_ADMIN_RULE_RESOURCE_ID_ROLE_ID` (`resource_id` ASC, `role_id` ASC) ,
  INDEX `IDX_ADMIN_RULE_ROLE_ID_RESOURCE_ID` (`role_id` ASC, `resource_id` ASC) ,
  CONSTRAINT `FK_ADMIN_RULE_ROLE_ID_ADMIN_ROLE_ROLE_ID`
    FOREIGN KEY (`role_id` )
    REFERENCES `mageclean`.`admin_role` (`role_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COMMENT = 'Admin Rule Table';


-- -----------------------------------------------------
-- Table `mageclean`.`admin_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mageclean`.`admin_user` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User ID' ,
  `firstname` VARCHAR(32) NULL DEFAULT NULL COMMENT 'User First Name' ,
  `lastname` VARCHAR(32) NULL DEFAULT NULL COMMENT 'User Last Name' ,
  `email` VARCHAR(128) NULL DEFAULT NULL COMMENT 'User Email' ,
  `username` VARCHAR(40) NULL DEFAULT NULL COMMENT 'User Login' ,
  `password` VARCHAR(100) NULL DEFAULT NULL COMMENT 'User Password' ,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Created Time' ,
  `modified` TIMESTAMP NULL DEFAULT NULL COMMENT 'User Modified Time' ,
  `logdate` TIMESTAMP NULL DEFAULT NULL COMMENT 'User Last Login Time' ,
  `lognum` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User Login Number' ,
  `reload_acl_flag` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL' ,
  `is_active` SMALLINT(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active' ,
  `extra` TEXT NULL DEFAULT NULL COMMENT 'User Extra Data' ,
  `rp_token` TEXT NULL DEFAULT NULL COMMENT 'Reset Password Link Token' ,
  `rp_token_created_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date' ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `UNQ_ADMIN_USER_USERNAME` (`username` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COMMENT = 'Admin User Table';

USE `mymod` ;
USE `mageclean` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
