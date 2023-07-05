ALTER TABLE `title` MODIFY `category` VARCHAR(25);

ALTER TABLE `title_copy` DROP `status`; 
DESCRIBE `title_copy`;

DROP TABLE `title_copy`;

RENAME TABLE `title` TO `movie_master`;

ALTER TABLE `title` DROP `RATING`;

ALTER TABLE `title_copy` MODIFY `status` CHAR(50);

CREATE TABLE `STAFF` (
	`staff_id` INT(5),
  	`first_name` VARCHAR(25),
  	`last_name`	VARCHAR(25),
  	`address` VARCHAR(150)
);