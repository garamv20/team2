-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema team2_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema team2_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `team2_db` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `team2_db` ;

-- -----------------------------------------------------
-- Table `team2_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`user` (
  `u_id` VARCHAR(100) NOT NULL,
  `u_pw` VARCHAR(100) NOT NULL,
  `u_phone` INT NOT NULL,
  `u_email` VARCHAR(100) NULL,
  `u_address` VARCHAR(100) NOT NULL,
  `u_name` VARCHAR(45) NOT NULL,
  `u_point` INT NULL,
  `u_grade` VARCHAR(10) NOT NULL,
  `u_manager` INT NOT NULL DEFAULT 0,
  `u_member` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`u_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`items` (
  `item_number` INT NOT NULL,
  `item_type` VARCHAR(100) NULL,
  `item_name` VARCHAR(100) NOT NULL,
  `item_price` INT NOT NULL,
  `item_discount_rate` DOUBLE NULL,
  `item_register_date` DATETIME NULL,
  `item_memo` VARCHAR(1000) NULL,
  PRIMARY KEY (`item_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`like` (
  `u_id` VARCHAR(100) NOT NULL,
  `item_number` INT NOT NULL,
  `l_count` INT NULL,
  PRIMARY KEY (`item_number`),
  INDEX `fk_like_user1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_like_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`point` (
  `u_id` VARCHAR(100) NOT NULL,
  `user_point` INT NOT NULL,
  `user_getpoint` INT NULL,
  `user_usepoint` INT NULL,
  `user_totalprice` INT NULL,
  INDEX `fk_point_user1_idx` (`u_id` ASC) VISIBLE,
  PRIMARY KEY (`u_id`),
  CONSTRAINT `fk_point_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`grade` (
  `g_grade` VARCHAR(50) NOT NULL,
  `g_score` VARCHAR(50) NULL,
  PRIMARY KEY (`g_grade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`cart` (
  `c_code` INT NOT NULL,
  `u_id` VARCHAR(100) NOT NULL,
  `item_number` INT NOT NULL,
  `c_option1` VARCHAR(100) NULL,
  `c_option2` VARCHAR(100) NULL,
  `c_qty` INT NULL,
  `c_price` INT NULL,
  `c_to_next` INT NULL,
  PRIMARY KEY (`c_code`),
  INDEX `fk_cart_user_idx` (`u_id` ASC) VISIBLE,
  INDEX `fk_cart_items1_idx` (`item_number` ASC) VISIBLE,
  CONSTRAINT `fk_cart_user`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_items1`
    FOREIGN KEY (`item_number`)
    REFERENCES `team2_db`.`items` (`item_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`review` (
  `r_num` INT NOT NULL,
  `r_title` VARCHAR(500) NOT NULL,
  `r_content` VARCHAR(1000) NOT NULL,
  `r_grade` INT NULL DEFAULT 0,
  `r_date` DATE NULL,
  `r_hit` INT NULL DEFAULT 0,
  `r_like` INT NULL DEFAULT 0,
  `item_num` INT NULL,
  `u_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`r_num`),
  INDEX `fk_review_user1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`notice` (
  `n_num` INT NOT NULL,
  `n_title` VARCHAR(500) NOT NULL,
  `n_content` VARCHAR(1000) NOT NULL,
  `n_date` DATE NULL,
  `u_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`n_num`),
  INDEX `fk_notice_user1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_notice_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`qna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`qna` (
  `q_num` INT NOT NULL,
  `q_category` VARCHAR(100) NULL,
  `q_title` VARCHAR(500) NOT NULL,
  `q_content` VARCHAR(1000) NOT NULL,
  `q_date` DATE NULL,
  `q_hit` INT NULL DEFAULT 0,
  `u_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`q_num`),
  INDEX `fk_qna_user1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_qna_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`faq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`faq` (
  `f_num` INT NOT NULL,
  `f_category` VARCHAR(100) NULL,
  `f_title` VARCHAR(500) NOT NULL,
  `f_content` VARCHAR(1000) NOT NULL,
  `u_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`f_num`),
  INDEX `fk_faq_user1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_faq_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `team2_db`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`comment` (
  `com_num` INT NOT NULL,
  `com_table` VARCHAR(45) NULL,
  `com_content` VARCHAR(1000) NULL,
  `com_ref` INT NULL,
  `com_step` INT NULL,
  `com_level` INT NULL,
  `table_num` INT NULL,
  `u_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`com_num`),
    INDEX `fk_comment_user1_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`u_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`order` (
  `order_number` INT NOT NULL,
  `order_status` VARCHAR(100) NOT NULL,
  `order_id` VARCHAR(100) NOT NULL,
  `order_tel` VARCHAR(100) NOT NULL,
  `order_address` VARCHAR(100) NOT NULL,
  `sell_quantity` INT NULL,
  `sell_price` INT NOT NULL,
  `payment_option` VARCHAR(100) NOT NULL,
  `rating` INT NULL,
  `comment` VARCHAR(1000) NULL,
  `memo` VARCHAR(1000) NULL,
  `order_date` DATETIME NULL,
  PRIMARY KEY (`order_number`),
  INDEX `fk_order_user1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`order_id`)
    REFERENCES `team2_db`.`user` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`option` (
  `item_number` INT NOT NULL,
  `option1` VARCHAR(45) NULL,
  `option2` VARCHAR(45) NULL,
  `sells` INT NULL,
  `remains` INT NULL,
  INDEX `fk_option_items1_idx` (`item_number` ASC) VISIBLE,
  CONSTRAINT `fk_option_items1`
    FOREIGN KEY (`item_number`)
    REFERENCES `team2_db`.`items` (`item_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2_db`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2_db`.`order_items` (
  `order_number` INT NOT NULL,
  `item_number` INT NOT NULL,
  `item_name` VARCHAR(45) NULL,
  `item_type` VARCHAR(45) NULL,
  `item_option1` VARCHAR(45) NULL,
  `item_option2` VARCHAR(45) NULL,
  `item_qty` INT NULL,
  `item_price` INT NULL,
  INDEX `fk_order_items_order1_idx` (`order_number` ASC) VISIBLE,
  PRIMARY KEY (`order_number`),
  INDEX `fk_order_items_items1_idx` (`item_number` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_order1`
    FOREIGN KEY (`order_number`)
    REFERENCES `team2_db`.`order` (`order_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_items1`
    FOREIGN KEY (`item_number`)
    REFERENCES `team2_db`.`items` (`item_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
