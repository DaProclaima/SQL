ALTER TABLE `sql_courses_vendredi`.`addresses`
ADD COLUMN `name_street` VARCHAR(45) NULL AFTER `num_street`,
CHANGE COLUMN `id` `id` INT(11) NOT NULL FIRST,
CHANGE COLUMN `extension_char` `extension_char` SET('t', 'b', '') NOT NULL AFTER `name_street`,
CHANGE COLUMN `num_streetname` `num_street` VARCHAR(255) NOT NULL ;

ALTER TABLE `sql_courses_vendredi`.`teachers`
CHANGE COLUMN `id` `code` INT(11) NOT NULL ;

ALTER TABLE `sql_courses_vendredi`.`UE`
ADD COLUMN `id` VARCHAR(45) NOT NULL AFTER `hours`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`);


ALTER TABLE `sql_courses_vendredi`.`ue_studants`
ADD COLUMN  `ue_code` VARCHAR(45) NULL FIRST,
CHANGE COLUMN `studants_id` `studant_id` INT(10) UNSIGNED NOT NULL;
ALTER TABLE `sql_courses_vendredi`.`ue_studants`
ADD CONSTRAINT `ue_code`
FOREIGN KEY (`ue_code`)
REFERENCES `sql_courses_vendredi`.`UE` (`code`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


INSERT INTO `sql_courses_vendredi`.`addresses`
(`id`,
 `num_street`,
 `extension_char`,
 `name_street`,
 `zipcode`,
 `cityname`)
VALUES
(1, 3, 'b', "Jean médecin", "O6000", "Nice"),
(2, 10, '', "Barla", "O6000", "Nice"),
(3, 10, '', "Jean Jaures", "O6200", "Cagnes") ;
# Error Code: 1364. Field 'studants_id' doesn't have a default value

INSERT INTO `sql_courses_vendredi`.`studants`
(`id`,
 `lastname`,
 `firstname`,
 `address_id`)
VALUES
(1001, "Nom1", "prenom1", 1) ,
(1002, "Nom2", "prenom2", 2) ,
(1003, "Nom3", "prenom3", 3) ;

INSERT INTO `sql_courses_vendredi`.`teachers`
(`code`,
 `lastname`,
 `firstname`,
 `age`,
 `hours_teaching`,
 `cityname`)
VALUES
(1, "Menez", "Gilles", 25, 35, "Antibes") ,
(2, "Lahire", "Philippe", 26, 30, "Nice") ,
(3, "Kounalis", "Emanuel", 27 , 28, "Nice"),
(4, "Renevier", "Philippe", 21, 28, "Nice") ;

INSERT INTO `sql_courses_vendredi`.`UE`
(`code`,
 `label`,
 `hours`,
 `id`)
VALUES
("SL2IBD", "Base de Données", 24, 2) ,
("SL2IPI", "Programmation impérative", 36, 1) ,
("SL2IAL", "Algorithmique", 32, 3) ,
("SL2IPW", "Programmation WEB", 26, 4);
;

INSERT INTO `sql_courses_vendredi`.`ue_studants`
(`studant_id`,
 `ue_code`,
 `cc_grade`,
 `exam_grade`
)
VALUES
(1001, "SL2IBD", 10, 11) ,
(1001, "SL2IPI", 8, 10) ,
(1002, "SL2IBD", 10, 11) ,
(1002, "SL2IPI", 8, 10),
(1003, "SL2IBD", 10, 11),
(1003, "SL2IPI", 8, 10),
(1003, "SL2IAL", 12, 13);

# 4 Cet ordre est logique puisque s'il n'était pas respecté nous auurions des erreurs,
# vu que des FK non existantes retournenaient des erreurs si on les appelait.









