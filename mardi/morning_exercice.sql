
-- Exo 1
USE sql_courses;
ALTER table users
ADD firstname VARCHAR(255) DEFAULT 'FIRSTAME',
ADD lastname VARCHAR(255) DEFAULT 'LASTNAME';

USE sql_courses;
ALTER table users
MODIFY COLUMN user_id MEDIUMINT NOT NULL;

USE sql_courses;
ALTER table users
CHANGE COLUMN firstname firstname VARCHAR(255), 
CHANGE COLUMN lastname lastname VARCHAR(255), 
ADD PRIMARY KEY person (lastname,firstname);

-- Exo 2
USE sql_courses;
ALTER table users
CHANGE COLUMN address address VARCHAR(100) DEFAULT 'Company',
ADD COLUMN telephone VARCHAR(100) DEFAULT '0650413928',
CHANGE lastname lastname VARCHAR(255) DEFAULT 'default';

-- Exo 3 Indexing
ALTER table users
DROP PRIMARY KEY person,
ADD PRIMARY KEY fullname (lastname,firstname),
ADD INDEX fullname;

-- Exo 4 Search
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Kibo","Maxwell","01 22 41 52 73"),("Sawyer","Neville","02 65 40 41 95"),("Kuame","Dexter","01 86 79 70 65"),("Daquan","Grant","05 38 68 70 85"),("David","Demetrius","09 58 01 49 76"),("Kieran","Avram","09 64 25 73 93"),("Hammett","Sawyer","06 64 27 69 48"),("Porter","Leonard","04 38 70 92 35"),("Jesse","Ishmael","08 22 31 08 83"),("Russell","Colorado","09 33 78 28 13");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Hu","Hamilton","06 89 81 40 78"),("Davis","Levi","09 33 01 54 93"),("Timothy","Cooper","04 76 79 95 97"),("Malcolm","Cole","06 36 92 69 91"),("Kevin","Phillip","02 16 59 62 26"),("Hiram","Ishmael","07 42 94 44 57"),("Alden","Ali","03 59 32 98 38"),("Aladdin","Anthony","09 81 95 28 18"),("Craig","Cullen","08 65 61 89 42"),("Ciaran","Jin","03 55 58 18 60");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Amos","Chaim","08 01 09 13 40"),("Ahmed","Perry","01 64 44 78 50"),("Marshall","Kibo","03 15 60 17 05"),("Dylan","Lewis","05 91 64 09 08"),("James","Kareem","03 06 72 65 87"),("Demetrius","Grady","08 90 71 52 62"),("Jin","David","07 55 74 78 36"),("Benedict","Austin","06 40 52 24 65"),("Kadeem","Judah","04 19 29 42 78"),("Jakeem","Jelani","08 02 67 48 71");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Zachary","Octavius","02 39 79 70 87"),("Scott","Brennan","03 24 84 47 28"),("Ashton","Lucian","08 84 09 61 28"),("Hammett","Marsden","06 82 09 05 18"),("Chase","Price","08 80 10 81 28"),("Andrew","Graham","09 35 63 35 48"),("Abdul","Curran","03 53 33 80 56"),("Oliver","Troy","05 53 14 64 56"),("Porter","Simon","05 42 24 69 62"),("Jerry","Kyle","03 11 50 76 98");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Rajah","Carter","04 66 96 90 62"),("Edward","Steven","08 10 56 10 74"),("Travis","Hakeem","09 85 37 25 44"),("Cooper","Erich","01 96 73 95 15"),("Lucas","Kasper","03 59 14 04 27"),("Zachery","Michael","04 08 29 56 45"),("Ulysses","John","09 48 45 72 43"),("Ishmael","Victor","07 64 70 07 84"),("Lev","Rigel","05 87 15 62 08"),("Hakeem","Noble","07 10 50 17 56");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Louis","Knox","06 70 24 51 13"),("Levi","Caesar","07 69 76 25 47"),("Lucas","Richard","05 24 20 61 10"),("Bert","Marsden","01 48 21 63 94"),("Francis","Baxter","01 44 20 77 63"),("Chadwick","Micah","02 05 72 32 04"),("Price","Jonas","06 62 74 16 09"),("Jelani","Felix","02 74 68 43 18"),("Garth","Honorato","02 76 20 74 06"),("Hakeem","Prescott","06 02 88 76 07");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Cooper","Francis","02 84 29 05 69"),("Dennis","Rooney","03 83 47 13 66"),("Jesse","Moses","02 30 16 30 99"),("Walker","Omar","04 11 25 32 15"),("Erich","Aidan","07 12 99 02 16"),("Hasad","Caleb","09 67 05 45 81"),("Louis","Addison","09 46 90 85 94"),("Fletcher","Tarik","06 88 50 12 08"),("Adam","Jacob","02 20 08 40 95"),("Carl","Dorian","01 67 21 54 89");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Mason","Aladdin","07 06 26 65 36"),("Cyrus","Bevis","06 20 96 26 76"),("Ralph","Cedric","01 24 75 95 69"),("Alec","Yoshio","07 76 39 31 70"),("Elton","James","03 37 69 87 48"),("Jesse","Isaac","02 39 61 01 23"),("Clinton","Colby","08 75 52 03 97"),("Connor","Carson","09 23 69 83 00"),("Magee","Lars","05 75 33 38 52"),("Kadeem","Marshall","01 08 46 95 95");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Kibo","Oscar","06 93 35 78 89"),("Plato","Callum","01 94 12 61 54"),("Aristotle","Baxter","01 45 39 20 84"),("Jameson","Beau","07 65 17 27 23"),("Brennan","Preston","09 90 36 93 98"),("Joshua","Damon","02 74 25 36 86"),("Macaulay","Hiram","05 55 32 16 95"),("Marshall","Linus","08 12 57 17 29"),("Elliott","Alec","05 29 95 99 39"),("Mason","Cyrus","09 71 67 24 02");
INSERT INTO `users` (`firstname`,`lastname`,`telephone`) VALUES ("Colorado","Cole","03 82 21 61 96"),("Valentine","Stone","08 25 20 96 93"),("Cole","Francis","08 20 55 11 86"),("Clinton","Hilel","05 12 17 43 31"),("Macaulay","Ryan","08 84 81 16 96"),("Fuller","Ishmael","05 71 56 72 52"),("Marsden","Shad","06 84 92 60 96"),("Duncan","Joel","06 10 82 74 88"),("Flynn","Abbot","09 98 28 64 27"),("Branden","Timothy","06 35 53 75 35");

CREATE INDEX searchPeople ON users (firstname, lastname);
SELECT * FROM users WHERE firstname LIKE 'M%' AND lastname LIKE 'S%' LIMIT 10;
UPDATE users SET telephone='0500005500' WHERE firstname LIKE 'M%' AND lastname LIKE 'S%';
SELECT * FROM users	 WHERE telephone LIKE '0500005500';



ALTER table users
ADD COLUMN age SMALLINT DEFAULT 0,
ADD COLUMN email VARCHAR(255) DEFAULT null;

UPDATE users SET age=age+1;
SELECT * FROM users;

-- Exo 4 Junctions
use sql_courses;
create table IF NOT EXISTS users(
  user_id MEDIUMINT NOT NULL,
  firstname VARCHAR(255) DEFAULT 'FIRSTAME',
  lastname VARCHAR(255) DEFAULT 'LASTNAME',
  creation_date DATETIME DEFAULT NOW(),
  address VARCHAR(100) DEFAULT 'Company',
  phone VARCHAR(100) DEFAULT '0650413928',
  email VARCHAR(255) DEFAULT null,
  age SMALLINT DEFAULT 0,
  fullname VARCHAR(500),
  PRIMARY KEY fullname (fullname)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

UPDATE users
SET fullname = CONCAT(firstname,'_', lastname);

create table IF NOT EXISTS articles(
     article_id MEDIUMINT NOT NULL PRIMARY KEY auto_increment,
     title VARCHAR(50) NOT NULL,
     text LONGTEXT,
     released_date DATE,
     author VARCHAR(50)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

alter table articles
DROP author,
ADD COLUMN user_id MEDIUMINT NOT NULL;

ALTER table users
ADD COLUMN article_id MEDIUMINT,
ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);

CREATE table IF NOT EXISTS topics(
   title VARCHAR(50) UNIQUE NOT NULL,
   topic_id MEDIUMINT PRIMARY KEY auto_increment
) ENGINE = INNODB DEFAULT CHARSET = utf8;;

ALTER TABLE articles
    ADD FK_topic_id MEDIUMINT,
    ADD FOREIGN KEY (FK_topic_id) REFERENCES topics(topic_id);
