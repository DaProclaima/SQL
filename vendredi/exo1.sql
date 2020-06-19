use sql_courses_vendredi;
CREATE TABLE `sql_courses_vendredi`.`studants` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`lastname` VARCHAR(255) NOT NULL,
`firstname` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `sql_courses_vendredi`.`ue` (
`code` VARCHAR(255) NOT NULL,
`label` VARCHAR(255) NOT NULL,
`hours` MEDIUMINT NULL,
UNIQUE INDEX `idUE_UNIQUE` (`code` ASC),
PRIMARY KEY (`code`),
UNIQUE INDEX `label_UNIQUE` (`label` ASC));

CREATE TABLE `sql_courses_vendredi`.`addresses` (
`num_streetname` VARCHAR(255) NOT NULL,
`cityname` VARCHAR(255) NOT NULL,
`zipcode` VARCHAR(255) NOT NULL,
`extension_char` SET('t', 'b', ' ') NOT NULL,
`id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`id`));

CREATE TABLE `sql_courses_vendredi`.`teachers` (
`id` INT NOT NULL,
`lastname` VARCHAR(255) NOT NULL,
`firstname` VARCHAR(255) NOT NULL,
`age` INT UNSIGNED NOT NULL,
`cityname` VARCHAR(255) NOT NULL,
`hours_teaching` MEDIUMINT(255) NULL,
PRIMARY KEY (`id`));

CREATE TABLE `sql_courses_vendredi`.`ue_studants` (
`cc_grade` INT NULL,
`exam_grade` INT NULL);


