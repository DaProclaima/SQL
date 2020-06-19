-- Exo 1
USE sql_courses;
create table users(
  firstname VARCHAR(255) DEFAULT 'FIRSTAME',
  lastname VARCHAR(255) DEFAULT 'LASTNAME',
  address TINYTEXT DEFAULT NULL,
  creation_date DATETIME DEFAULT NOW(),
  user_id MEDIUMINT UNSIGNED PRIMARY KEY auto_increment
);

INSERT INTO `users` (`firstname`, `lastname`, `address`, `creation_date`)
 VALUES 
 ('Sébastien', 'NOBOUR', '12 avenue des hirondelles', '2020-06-16 09:11:25'),
 (NULL, NULL, NULL, NULL)
 ;

--  Exo 2
USE sql_courses;
ALTER users
ADD email VARCHAR(255) NULL;
--  INSERT INTO `users`
ALTER TABLE users
ADD email VARCHAR(255) UNIQUE NOT NULL;

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `address`, `creation_date`, `email`) VALUES (NULL, 'FIRSTAME', 'LASTNAME', NULL, CURRENT_TIMESTAMP, 'izi@gmail.com');

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `address`, `creation_date`, `email`) VALUES (NULL, 'FIRSTAME', 'LASTNAME', NULL, CURRENT_TIMESTAMP, 'izi@gmail.com');
--  #1062 - Duplicate entry 'izi@gmail.com' for key 'email'

--  Exo 3
USE sql_courses;
SET FOREIGN_KEY_CHECKS = 0;

-- SELECT
--     users
-- FROM
--     information_schema.tables
-- WHERE
--     table_schema = sql_courses
-- ;

-- SELECT
--   topics
-- FROM
--   information_schema.tables
-- WHERE
--   table_schema = sql_courses
-- ;

-- SELECT
--   topics
-- FROM
--   information_schema.tables
-- WHERE
--   table_schema = sql_courses
-- ;

DROP TABLE IF EXISTS users, topics, articles;

-- SET FOREIGN_KEY_CHECKS = 1;

-- Exo 4
USE sql_courses;

DROP table users;
create table users(
  firstname VARCHAR(255) DEFAULT 'FIRSTAME',
  lastname VARCHAR(255) DEFAULT 'LASTNAME',
  address TINYTEXT DEFAULT NULL,
  creation_date DATETIME DEFAULT NOW(),
  email VARCHAR(255) NOT NULL UNIQUE,
  user_id MEDIUMINT UNSIGNED PRIMARY KEY auto_increment
);

ALTER table users
DROP COLUMN firstname, 
DROP COLUMN lastname,
DROP COLUMN email;