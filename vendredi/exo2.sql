CREATE TABLE IF NOT EXISTS `sql_courses_vendredi`.`addresses` (
`num_streetname` VARCHAR(255) NOT NULL,
`cityname` VARCHAR(255) NOT NULL,
`zipcode` VARCHAR(255) NOT NULL,
`extension_char` SET('t', 'b', '') NOT NULL,
`id` INT(11) NOT NULL AUTO_INCREMENT,
`studants_id` INT(10) UNSIGNED NOT NULL,
PRIMARY KEY (`id`, `studants_id`),
INDEX `fk_addresses_studants_idx` (`studants_id` ASC) VISIBLE,
CONSTRAINT `fk_addresses_studants`
FOREIGN KEY (`studants_id`)
REFERENCES `sql_courses_vendredi`.`studants` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8


# 3. UE. A propos de la liaison de la relation UE avec la relation Enseignant afin d’exprimer le fait que chaque UE a un enseignant responsable. Que pouvez-vous dire ?
# Une table teacher_manage_ue est nécessaire.
# Car une UE a forcément besoin d'un manager mais un prof n'a pas l'obligation de devenir un manager
# Comme on ne peut mettre en place une telle cardinalité dans les liaisons, alors une table supplémentaire est necessaire.

# 4  A propos de la liaison de la relation EtudiantUE avec la relation Etudiant afin d’exprimer
# le fait que les notes sont obtenues par un certain étudiant. Que pouvez-vous dire ?
# Je definie la PK de EtudiantUE comme étant l'ID de l'étudiant. Je ne définie donc pas de FK.

-- MySQL Workbench Synchronization
-- Generated: 2020-06-19 16:48
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: SNitpro

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `sql_courses_vendredi`.`teacher_manage_ue`
    DROP FOREIGN KEY `fk_teachers_has_UE_UE1`;

ALTER TABLE `sql_courses_vendredi`.`studants`
    ADD COLUMN `addresses_id1` INT(10) NOT NULL AFTER `addresses_id`,
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`id`, `addresses_id1`),
    ADD INDEX `fk_studants_addresses1_idx1` (`addresses_id1` ASC) ;
;

ALTER TABLE `sql_courses_vendredi`.`teacher_manage_ue`
    DROP COLUMN `UE_code`,
    ADD COLUMN `ue_code` VARCHAR(255) NOT NULL AFTER `teachers_id`,
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`teachers_id`, `ue_code`),
    ADD INDEX `fk_teacher_manage_ue_UE1_idx` (`ue_code` ASC) ,
    DROP INDEX `fk_teachers_has_UE_UE1_idx` ;
;

ALTER TABLE `sql_courses_vendredi`.`ue_studants`
    DROP COLUMN `studants_id`,
    ADD COLUMN `studants_id` INT(10) UNSIGNED NOT NULL AFTER `exam_grade`,
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`studants_id`),
    ADD INDEX `fk_ue_studants_studants1_idx` (`studants_id` ASC) ;
;

ALTER TABLE `sql_courses_vendredi`.`studants`
    ADD CONSTRAINT `fk_studants_addresses1`
        FOREIGN KEY (`addresses_id1`)
            REFERENCES `sql_courses_vendredi`.`addresses` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

ALTER TABLE `sql_courses_vendredi`.`teacher_manage_ue`
    ADD CONSTRAINT `fk_teacher_manage_ue_UE1`
        FOREIGN KEY (`ue_code`)
            REFERENCES `sql_courses_vendredi`.`ue` (`code`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

ALTER TABLE `sql_courses_vendredi`.`ue_studants`
    ADD CONSTRAINT `fk_ue_studants_studants1`
        FOREIGN KEY (`studants_id`)
            REFERENCES `sql_courses_vendredi`.`studants` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
