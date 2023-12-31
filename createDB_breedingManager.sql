-- Creation of 'breedingManager' database

-- Setting start of commit
SET AUTOCOMMIT = 0;
START TRANSACTION;

-- Deleting database if one exists with the same name
DROP DATABASE
    IF EXISTS breedingManager;

-- Creating database
CREATE DATABASE breedingManager
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;
USE breedingManager;


-- `user` table : login and passwords for users
CREATE TABLE user (
    id_user INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_login VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO user (id_user, user_login, user_password)
    VALUES 
    (1, 'admin', 'admin'),
    (2, 'mbon', 'mb');


-- `animal` table : all the animals that are breeded or have been bred
CREATE TABLE animal (
    id_animal INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_breed INT NOT NULL,
    animal_name VARCHAR(30) NOT NULL,
    animal_sex CHAR(1) NOT NULL,
    animal_height INT NOT NULL,
    animal_weight INT NOT NULL,
    animal_lifespan INT NOT NULL,
    birth_time TIMESTAMP NOT NULL,
    death_time TIMESTAMP DEFAULT 0,
    id_father INT DEFAULT 0,
    id_mother INT DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


-- `breed` table : different breeds of animals
CREATE TABLE breed (
    id_breed INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed_name VARCHAR(50) DEFAULT NULL,
    id_animal_specie INT DEFAULT NULL,
    min_avg_lifespan INT DEFAULT NULL,
    max_avg_lifespan INT DEFAULT NULL,
    min_avg_height INT DEFAULT NULL,
    max_avg_height INT DEFAULT NULL,
    min_avg_weight INT DEFAULT NULL,
    max_avg_weight INT DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO breed (
    breed_name, 
    id_animal_specie, 
    min_avg_lifespan, 
    max_avg_lifespan,
    min_avg_height,
    max_avg_height,
    min_avg_weight,
    max_avg_weight
) VALUES 
    ('Ball Python', 1, 60, 90, 120, 180, 1200, 1600),
    ('Corn Snake', 1, 65, 100, 120, 150, 300, 600),
    ('Boa Constrictor', 1, 70, 300, 180, 400, 5000, 9000),
    ('Green Tree Python', 1, 120, 240, 120, 180, 1000, 1800),
    ('King Cobra', 1, 200, 360, 300, 400, 4000, 6000),
    ('Black Mamba', 1, 100, 220, 200, 250, 1800, 3000),
    ('Reticulated Python', 1, 80, 180, 180, 730, 45000, 91000),
    ('Garter Snake', 1, 90, 180, 50, 70, 100, 300),
    ('Anaconda', 1, 100, 200, 450, 600, 27000, 45000),
    ('Gaboon Viper', 1, 85, 210, 100, 150, 6500, 13000),
    ('Burmese Python', 1, 150, 280, 180, 450, 36000, 68000),
    ('Indian Python', 1, 100, 200, 100, 370, 22000, 45000),
    ('Carpet Python', 1, 60, 100, 180, 240, 3500, 6000),
    ('Amazon Tree Boa', 1, 120, 190, 90, 150, 500, 1000),
    ('Western Hognose Snake', 1, 50, 140, 50, 70, 100, 200);


-- `animal_specie` table : references all the animal species
CREATE TABLE animal_specie (
    id_animal_specie INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    specie_name VARCHAR(50) DEFAULT NULL,
    specie_name_plural VARCHAR(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO animal_specie (id_animal_specie, specie_name, specie_name_plural)
    VALUES 
    (1, 'snake', 'snakes'),
    (2, 'cat', 'cats');


-- `name_source` table : contains a database of names and sex used to create random animals
CREATE TABLE name_source (
    id_name_source INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_example VARCHAR(50) DEFAULT NULL,
    sex_example CHAR(1) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO name_source (id_name_source, name_example, sex_example)
VALUES
(1, 'Donald', 'M'),
(2, 'Daisy', 'F'),
(3, 'Michael', 'M'),
(4, 'Christopher', 'M'),
(5, 'Matthew', 'M'),
(6, 'Andrew', 'M'),
(7, 'James', 'M'),
(8, 'John', 'M'),
(9, 'Robert', 'M'),
(10, 'William', 'M'),
(11, 'Joseph', 'M'),
(12, 'Daniel', 'M'),
(13, 'David', 'M'),
(14, 'Brian', 'M'),
(15, 'Kevin', 'M'),
(16, 'Thomas', 'M'),
(17, 'Steven', 'M'),
(18, 'Richard', 'M'),
(19, 'Charles', 'M'),
(20, 'Mark', 'M'),
(21, 'Anthony', 'M'),
(22, 'Jeffrey', 'M'),
(23, 'Timothy', 'M'),
(24, 'Scott', 'M'),
(25, 'Ryan', 'M'),
(26, 'Paul', 'M'),
(27, 'Eric', 'M'),
(28, 'Jason', 'M'),
(29, 'Jonathan', 'M'),
(30, 'Jeremy', 'M'),
(31, 'Gregory', 'M'),
(32, 'Adam', 'M'),
(33, 'Benjamin', 'M'),
(34, 'Peter', 'M'),
(35, 'George', 'M'),
(36, 'Kenneth', 'M'),
(37, 'Nicholas', 'M'),
(38, 'Edward', 'M'),
(39, 'Samuel', 'M'),
(40, 'Jerry', 'M'),
(41, 'Raymond', 'M'),
(42, 'Patrick', 'M'),
(43, 'Gary', 'M'),
(44, 'Stephen', 'M'),
(45, 'Dennis', 'M'),
(46, 'Larry', 'M'),
(47, 'Bryan', 'M'),
(48, 'Ronald', 'M'),
(49, 'Douglas', 'M'),
(50, 'Roger', 'M'),
(51, 'Greg', 'M'),
(52, 'Jesse', 'M'),
(53, 'Terry', 'M'),
(54, 'Frank', 'M'),
(55, 'Christian', 'M'),
(56, 'Gerald', 'M'),
(57, 'Ray', 'M'),
(58, 'Joe', 'M'),
(59, 'Phillip', 'M'),
(60, 'Caleb', 'M'),
(61, 'Danny', 'M'),
(62, 'Alan', 'M'),
(63, 'Evan', 'M'),
(64, 'Walter', 'M'),
(65, 'Ethan', 'M'),
(66, 'Harry', 'M'),
(67, 'Fred', 'M'),
(68, 'Wayne', 'M'),
(69, 'Louis', 'M'),
(70, 'Bruce', 'M'),
(71, 'Billy', 'M'),
(72, 'Stanley', 'M'),
(73, 'Willie', 'M'),
(74, 'Jordan', 'M'),
(75, 'Sam', 'M'),
(76, 'Albert', 'M'),
(77, 'Randy', 'M'),
(78, 'Howard', 'M'),
(79, 'Justin', 'M'),
(80, 'Vincent', 'M'),
(81, 'Bob', 'M'),
(82, 'Jeremiah', 'M'),
(83, 'Bobby', 'M'),
(84, 'Roy', 'M'),
(85, 'Phillip', 'M'),
(86, 'Alan', 'M'),
(87, 'Juan', 'M'),
(88, 'Harry', 'M'),
(89, 'Eugene', 'M'),
(90, 'Jesse', 'M'),
(91, 'Jim', 'M'),
(92, 'Tom', 'M'),
(93, 'Ronnie', 'M'),
(94, 'Gary', 'M'),
(95, 'Bobby', 'M'),
(96, 'Martin', 'M'),
(97, 'Joe', 'M'),
(98, 'Paul', 'M'),
(99, 'Ron', 'M'),
(100, 'Anthony', 'M'),
(101, 'Ralph', 'M'),
(102, 'Kevin', 'M'),
(103, 'Raymond', 'M'),
(104, 'Carl', 'M'),
(105, 'Roger', 'M'),
(106, 'Jeremiah', 'M'),
(107, 'Michael', 'M'),
(108, 'George', 'M'),
(109, 'Edward', 'M'),
(110, 'Mark', 'M'),
(111, 'Jerry', 'M'),
(112, 'Joshua', 'M'),
(113, 'Matthew', 'M'),
(114, 'James', 'M'),
(115, 'Robert', 'M'),
(116, 'John', 'M'),
(117, 'David', 'M'),
(118, 'William', 'M'),
(119, 'Charles', 'M'),
(120, 'Steven', 'M'),
(121, 'Richard', 'M'),
(122, 'Brian', 'M'),
(123, 'Andrew', 'M'),
(124, 'Jeffrey', 'M'),
(125, 'Timothy', 'M'),
(126, 'Ryan', 'M'),
(127, 'Thomas', 'M'),
(128, 'Scott', 'M'),
(129, 'Paul', 'M'),
(130, 'Eric', 'M'),
(131, 'Jason', 'M'),
(132, 'Jonathan', 'M'),
(133, 'Jeremiah', 'M'),
(134, 'Gregory', 'M'),
(135, 'Adam', 'M'),
(136, 'Benjamin', 'M'),
(137, 'Peter', 'M'),
(138, 'Kenneth', 'M'),
(139, 'Nicholas', 'M'),
(140, 'Edward', 'M'),
(141, 'Samuel', 'M'),
(142, 'Jerry', 'M'),
(143, 'Raymond', 'M'),
(144, 'Patrick', 'M'),
(145, 'Gary', 'M'),
(146, 'Stephen', 'M'),
(147, 'Dennis', 'M'),
(148, 'Brandon', 'M'),
(149, 'Cameron', 'M'),
(150, 'Dominic', 'M'),
(151, 'Jennifer', 'F'),
(152, 'Jessica', 'F'),
(153, 'Emily', 'F'),
(154, 'Amanda', 'F'),
(155, 'Sarah', 'F'),
(156, 'Elizabeth', 'F'),
(157, 'Megan', 'F'),
(158, 'Natalie', 'F'),
(159, 'Taylor', 'F'),
(160, 'Hannah', 'F'),
(161, 'Alexis', 'F'),
(162, 'Samantha', 'F'),
(163, 'Ashley', 'F'),
(164, 'Madison', 'F'),
(165, 'Olivia', 'F'),
(166, 'Abigail', 'F'),
(167, 'Isabella', 'F'),
(168, 'Grace', 'F'),
(169, 'Alyssa', 'F'),
(170, 'Brianna', 'F'),
(171, 'Emma', 'F'),
(172, 'Ava', 'F'),
(173, 'Chloe', 'F'),
(174, 'Zoe', 'F'),
(175, 'Sophia', 'F'),
(176, 'Mia', 'F'),
(177, 'Natalie', 'F'),
(178, 'Hailey', 'F'),
(179, 'Ella', 'F'),
(180, 'Scarlett', 'F'),
(181, 'Avery', 'F'),
(182, 'Lily', 'F'),
(183, 'Addison', 'F'),
(184, 'Lillian', 'F'),
(185, 'Grace', 'F'),
(186, 'Nora', 'F'),
(187, 'Evelyn', 'F'),
(188, 'Amelia', 'F'),
(189, 'Sophie', 'F'),
(190, 'Eleanor', 'F'),
(191, 'Penelope', 'F'),
(192, 'Liam', 'F'),
(193, 'Layla', 'F'),
(194, 'Hazel', 'F'),
(195, 'Mila', 'F'),
(196, 'Aurora', 'F'),
(197, 'Aria', 'F'),
(198, 'Ella', 'F'),
(199, 'Scarlett', 'F'),
(200, 'Avery', 'F'),
(201, 'Lily', 'F'),
(202, 'Addison', 'F'),
(203, 'Lillian', 'F'),
(204, 'Grace', 'F'),
(205, 'Nora', 'F'),
(206, 'Evelyn', 'F'),
(207, 'Emma', 'F'),
(208, 'Sophia', 'F'),
(209, 'Isabella', 'F'),
(210, 'Olivia', 'F'),
(211, 'Mia', 'F'),
(212, 'Ava', 'F'),
(213, 'Zoe', 'F'),
(214, 'Natalie', 'F'),
(215, 'Chloe', 'F'),
(216, 'Sofia', 'F'),
(217, 'Aria', 'F'),
(218, 'Riley', 'F'),
(219, 'Liam', 'F'),
(220, 'Layla', 'F'),
(221, 'Hazel', 'F'),
(222, 'Mila', 'F'),
(223, 'Charlotte', 'F'),
(224, 'Emma', 'F'),
(225, 'Sophia', 'F'),
(226, 'Olivia', 'F'),
(227, 'Ava', 'F'),
(228, 'Mia', 'F'),
(229, 'Isabella', 'F'),
(230, 'Riley', 'F'),
(231, 'Aria', 'F'),
(232, 'Zoe', 'F'),
(233, 'Lily', 'F'),
(234, 'Emily', 'F'),
(235, 'Grace', 'F'),
(236, 'Nora', 'F'),
(237, 'Evelyn', 'F'),
(238, 'Abigail', 'F'),
(239, 'Sophia', 'F'),
(240, 'Emma', 'F'),
(241, 'Olivia', 'F'),
(242, 'Ava', 'F'),
(243, 'Mia', 'F'),
(244, 'Isabella', 'F'),
(245, 'Charlotte', 'F'),
(246, 'Amelia', 'F'),
(247, 'Harper', 'F'),
(248, 'Evelyn', 'F'),
(249, 'Abigail', 'F'),
(250, 'Emily', 'F'),
(251, 'Sofia', 'F'),
(252, 'Aria', 'F'),
(253, 'Zoe', 'F'),
(254, 'Riley', 'F'),
(255, 'Liam', 'F'),
(256, 'Layla', 'F'),
(257, 'Hazel', 'F'),
(258, 'Mila', 'F'),
(259, 'Charlotte', 'F'),
(260, 'Emma', 'F'),
(261, 'Sophia', 'F'),
(262, 'Olivia', 'F'),
(263, 'Ava', 'F'),
(264, 'Mia', 'F'),
(265, 'Isabella', 'F'),
(266, 'Riley', 'F'),
(267, 'Aria', 'F'),
(268, 'Zoe', 'F'),
(269, 'Lily', 'F'),
(270, 'Emily', 'F'),
(271, 'Grace', 'F'),
(272, 'Nora', 'F'),
(273, 'Evelyn', 'F'),
(274, 'Abigail', 'F'),
(275, 'Sophia', 'F'),
(276, 'Emma', 'F'),
(277, 'Olivia', 'F'),
(278, 'Jean-Pierre', 'M'),
(279, 'Mia', 'F'),
(280, 'Isabella', 'F'),
(281, 'Charlotte', 'F'),
(282, 'Amelia', 'F'),
(283, 'Harper', 'F'),
(284, 'Evelyn', 'F'),
(285, 'Abigail', 'F'),
(286, 'Emily', 'F'),
(287, 'Sofia', 'F'),
(288, 'Aria', 'F'),
(289, 'Zoe', 'F'),
(290, 'Riley', 'F'),
(291, 'Liam', 'F'),
(292, 'Layla', 'F'),
(293, 'Hazel', 'F'),
(294, 'Mila', 'F'),
(295, 'Charlotte', 'F'),
(296, 'Samantha', 'F'),
(297, 'Olivia', 'F'),
(298, 'Ella', 'F'),
(299, 'Grace', 'F'),
(300, 'Lily', 'F');


-- column_label table : label for each column in the database

CREATE TABLE column_label (
    id_column_label VARCHAR(50) NOT NULL PRIMARY KEY,
    label VARCHAR(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO column_label (id_column_label, label)
    VALUES 
    ('id_animal', 'ID'),
    ('id_breed', 'Breed ID'),
    ('animal_name', 'Name'),
    ('animal_sex', 'Sex'),
    ('animal_height', 'Height (cm)'),
    ('animal_weight', 'Weight (g)'),
    ('animal_lifespan', 'Lifespan (sec)'),
    ('birth_time', 'Birth'),
    ('death_time', 'Death'),
    ('id_father', 'Father ID'),
    ('id_mother', 'Mother ID'),
    ('breed_name', 'Breed');
    


-- Set keys
ALTER TABLE animal
    ADD KEY id_animal (id_animal);

ALTER TABLE breed
    ADD KEY id_breed (id_breed);

ALTER TABLE animal_specie
    ADD KEY id_animal_specie (id_animal_specie);

ALTER TABLE user
    ADD KEY id_user (id_user);

ALTER TABLE column_label
    ADD KEY id_column_label (id_column_label);


-- Creating a view to get live animals for animal_list.php
CREATE VIEW breedingManager.animalList AS (SELECT 
                                                id_animal, 
                                                animal_name, 
                                                animal_sex,                                                 
                                                breed_name,
                                                animal_height, 
                                                animal_weight,
                                                animal_lifespan,
                                                DATE_FORMAT(birth_time, '%d/%m/%Y %H:%i:%s') AS birth_time
                                                  FROM animal
                                                    INNER JOIN breed
                                                            ON animal.id_breed = breed.id_breed
                                                                WHERE death_time = '0000-00-00 00:00:00');


-- Creating a view to get live animals for animal_list.php
CREATE VIEW breedingManager.deceasedAnimalList AS (SELECT 
                                                id_animal, 
                                                animal_name, 
                                                animal_sex,                                                 
                                                breed_name,
                                                animal_height, 
                                                animal_weight,
                                                animal_lifespan,
                                                DATE_FORMAT(birth_time, '%d/%m/%Y %H:%i:%s') AS birth_time,
                                                DATE_FORMAT(death_time, '%d/%m/%Y %H:%i:%s') AS death_time
                                                  FROM animal
                                                    INNER JOIN breed
                                                            ON animal.id_breed = breed.id_breed
                                                                WHERE death_time != '0000-00-00 00:00:00');


-- Creating a view to count the number of animals per breed
CREATE VIEW breedingManager.breedCount AS (
    SELECT 
        breed_name,
        COUNT(id_animal) AS breed_count
    FROM animal
    INNER JOIN breed
        ON animal.id_breed = breed.id_breed
    WHERE death_time = '0000-00-00 00:00:00'
    GROUP BY breed_name
    ORDER BY breed_name ASC
);


-- Stored procedure to get parent details
-- Input parameters : id_animal, parent_type (father, mother)

DELIMITER //

CREATE PROCEDURE breedingManager.getParentDetails(IN in_id INT, IN parent_type VARCHAR(10))
BEGIN
    IF parent_type = 'father' THEN
        SELECT id_animal, animal_name, breed.id_breed, breed_name,
                DATE_FORMAT(birth_time, '%d/%m/%Y %H:%i:%s') AS birth_time,
                DATE_FORMAT(death_time, '%d/%m/%Y %H:%i:%s') AS death_time
        FROM animal
        INNER JOIN breed ON animal.id_breed = breed.id_breed
        WHERE id_animal = (SELECT id_father FROM animal WHERE id_animal = in_id);
    ELSEIF parent_type = 'mother' THEN
        SELECT id_animal, animal_name, breed.id_breed, breed_name,
                DATE_FORMAT(birth_time, '%d/%m/%Y %H:%i:%s') AS birth_time,
                DATE_FORMAT(death_time, '%d/%m/%Y %H:%i:%s') AS death_time
        FROM animal
        INNER JOIN breed ON animal.id_breed = breed.id_breed
        WHERE id_animal = (SELECT id_mother FROM animal WHERE id_animal = in_id);
    END IF;
END //

DELIMITER ;


-- Stored procedure to get children details
-- Input parameters : id_animal, parent_type (father, mother)

DELIMITER //

CREATE PROCEDURE breedingManager.getChildrenDetails(IN in_id INT)
BEGIN
    SELECT id_animal, animal_name, animal_sex, breed.id_breed, breed_name,
            DATE_FORMAT(birth_time, '%d/%m/%Y %H:%i:%s') AS birth_time,
            DATE_FORMAT(death_time, '%d/%m/%Y %H:%i:%s') AS death_time
    FROM animal
    INNER JOIN breed ON animal.id_breed = breed.id_breed
    WHERE id_father = in_id
       OR id_mother = in_id;

END //

DELIMITER ;


-- Stored procedure to generate random animals
-- Input parameters amount to create, breed, id_father, id_mother

-- If optionalFatherID and optionalMotherID are NULL, then set @id_breed with a value,
-- only if there are at least one male and one female of the same breed
-- If optionalFatherID and optionalMotherID are not NULL, set @id_breed with a random id_breed in breed table
-- If optionalBreed parameter is given, set @id_breed with input parameter value

DELIMITER //

CREATE PROCEDURE breedingManager.createRandomAnimals(
    IN numCalls INT,
    IN optionalBreed INT,
    IN optionalFatherID INT,
    IN optionalMotherID INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE id_father INT;
    DECLARE id_mother INT;

    WHILE i <= numCalls DO

        IF optionalFatherID IS NULL AND optionalMotherID IS NULL AND optionalBreed IS NULL THEN
            SELECT id_breed INTO @id_breed 
                FROM (SELECT DISTINCT id_breed FROM animal WHERE animal_sex = 'M'
                        INTERSECT
                      SELECT DISTINCT id_breed FROM animal WHERE animal_sex = 'F') AS available_breeds
                ORDER BY RAND() LIMIT 1;

        ELSEIF optionalBreed IS NOT NULL THEN
            SET @id_breed = optionalBreed;

        ELSE
            SELECT id_breed INTO @id_breed
                FROM breed
                ORDER BY RAND() LIMIT 1;
        END IF;

        -- Random id_father
        IF optionalFatherID IS NULL THEN
            -- Select a random existing animal_id where death_time = 0 and animal_sex = 'M'
            SELECT id_animal INTO id_father
            FROM animal
            WHERE death_time = 0 AND animal_sex = 'M' AND id_breed = @id_breed
            ORDER BY RAND()
            LIMIT 1;
        ELSE
            SET id_father = optionalFatherID;
        END IF;

        -- Random id_mother
        IF optionalMotherID IS NULL THEN
            -- Select a random existing animal_id where death_time = 0 and animal_sex = 'F'
            SELECT id_animal INTO id_mother
            FROM animal
            WHERE death_time = 0 AND animal_sex = 'F' AND id_breed = @id_breed
            ORDER BY RAND()
            LIMIT 1;
        ELSE
            SET id_mother = optionalMotherID;
        END IF;

        -- Random animal_name and animal_sex
        SELECT (SELECT id_name_source FROM name_source ORDER BY RAND() LIMIT 1) INTO @id_name_source;
        SELECT (SELECT name_example FROM name_source WHERE id_name_source = @id_name_source) INTO @animal_name;
        SELECT (SELECT sex_example FROM name_source WHERE id_name_source = @id_name_source) INTO @animal_sex;

        -- Random animal_height
        SELECT min_avg_height INTO @min_avg_height FROM breed WHERE id_breed = @id_breed;
        SELECT max_avg_height INTO @max_avg_height FROM breed WHERE id_breed = @id_breed;
        SELECT FLOOR(@min_avg_height + RAND() * (@max_avg_height - @min_avg_height + 1)) INTO @animal_height;

        -- Random animal_weight
        SELECT min_avg_weight INTO @min_avg_weight FROM breed WHERE id_breed = @id_breed;
        SELECT max_avg_weight INTO @max_avg_weight FROM breed WHERE id_breed = @id_breed;
        SELECT FLOOR(@min_avg_weight + RAND() * (@max_avg_weight - @min_avg_weight + 1)) INTO @animal_weight;

        -- Random animal_lifespan
        SELECT min_avg_lifespan INTO @min_avg_lifespan FROM breed WHERE id_breed = @id_breed;
        SELECT max_avg_lifespan INTO @max_avg_lifespan FROM breed WHERE id_breed = @id_breed;
        SELECT FLOOR(@min_avg_lifespan + RAND() * (@max_avg_lifespan - @min_avg_lifespan + 1)) INTO @animal_lifespan;

        -- Random datetime in the last 7 days
        SELECT DATE_FORMAT(CURRENT_TIMESTAMP() - INTERVAL FLOOR(RAND() * 15) SECOND, '%Y-%m-%d %H:%i:%s') INTO @birth_time;

        IF id_father IS NOT NULL AND id_mother IS NOT NULL THEN
            -- Create new animal with random or specified values
            INSERT INTO animal (
                id_breed,
                animal_name,
                animal_sex,
                animal_height,
                animal_weight,
                animal_lifespan,
                birth_time,
                id_father,
                id_mother
            )
            VALUES (
                @id_breed,
                @animal_name,
                @animal_sex,
                @animal_height,
                @animal_weight,
                @animal_lifespan,
                @birth_time,
                id_father,
                id_mother
            );
        END IF;

        SET i = i + 1;
    END WHILE;

END//

DELIMITER ;


-- Stored procedure to add death_time if lifespan reached and generate new random matings

DELIMITER //

CREATE PROCEDURE breedingManager.createRandomMating(IN numCalls INT)
BEGIN

CALL createRandomAnimals(numCalls, NULL, NULL, NULL);

END//

DELIMITER ;


-- Creating a stored procedure to set death_time if lifespan reached
DELIMITER //

CREATE PROCEDURE breedingManager.setDeathTime()
BEGIN
    UPDATE animal
    SET death_time = DATE_ADD(birth_time, INTERVAL animal_lifespan SECOND)
    WHERE death_time = 0 AND DATE_ADD(birth_time, INTERVAL animal_lifespan SECOND) <= CURRENT_TIMESTAMP();
END//

DELIMITER ;


-- Generating 200 random animals to populate the `animal` table
CALL createRandomAnimals(200, NULL, 0, 0);




-- End of commit
COMMIT;
SET AUTOCOMMIT = 1;