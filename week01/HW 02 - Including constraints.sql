CREATE TABLE `title` (
	`title_id` INT NOT NULL PRIMARY KEY,
  	`title`	VARCHAR(60) NOT NULL,
  	`description` VARCHAR(400) NOT NULL,
  	`rating` VARCHAR(4),
  	`category` VARCHAR(20),
  	`release_date` DATE
);

CREATE TABLE `title` (
	`title_id` INT NOT NULL,
  	`title`	VARCHAR(60) NOT NULL,
  	`description` VARCHAR(400) NOT NULL,
  	`rating` VARCHAR(4),
  	`category` VARCHAR(20),
  	`release_date` DATE,
  
  	PRIMARY KEY (`title_id`)
);

CREATE TABLE `title_copy` (
  `copy_id` INT NOT NULL PRIMARY KEY,
  `title_id` INT NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  
  FOREIGN KEY (`title_id`) REFERENCES title(title_id) ON DELETE CASCADE
);

CREATE TABLE `title_copy` (
  `copy_id` INT NOT NULL,
  `title_id` INT NOT NULL,
  `status` VARCHAR(15) NOT NULL,
  
  PRIMARY KEY (`copy_id`),
  FOREIGN KEY (`title_id`) REFERENCES title(title_id) ON DELETE CASCADE
);

ALTER TABLE `title` ADD CONSTRAINT `title_un` UNIQUE (`title`);

ALTER TABLE `title` MODIFY `release_date` DATE NOT NULL;

ALTER TABLE `title` ADD CONSTRAINT `title_cat_fk` FOREIGN KEY (`category_id`) REFERENCES title_category(title_category_id)

ALTER TABLE `title` DROP PRIMARY KEY;

ALTER TABLE `title` DROP INDEX `title_un`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `employees`;
DROP TABLE `jobs`;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE `employees` DROP FOREIGN KEY `employees_jobs_job_id`;
ALTER TABLE `job_history` DROP FOREIGN KEY `job_history_jobs_job_id`;
DROP TABLE `jobs`;

ALTER TABLE `locations` DROP FOREIGN KEY `locations_countries_country_id`;
DROP TABLE `countries`;

ALTER TABLE `title_copy` DROP FOREIGN KEY `title_copy_ibfk_1`;
ALTER TABLE `title_copy` DROP COLUMN `title_id`;
