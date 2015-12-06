SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `msrsurvey`;
CREATE SCHEMA IF NOT EXISTS `msrsurvey` DEFAULT CHARACTER SET utf8;
USE `msrsurvey`;

DROP TABLE IF EXISTS `msrsurvey`.`Projects`;
CREATE TABLE Projects (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `date` TEXT NOT NULL,
    `home` TEXT,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `msrsurvey`.`Users`;
CREATE TABLE `Users` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `project` INTEGER NOT NULL,
    `name` TEXT NOT NULL,
    `OSS_exp` INTEGER,
    `work_exp` INTEGER,
    `role` TEXT,
    PRIMARY KEY (`id`),
    FOREIGN KEY(`project`) REFERENCES Projects ( `id` )
);

DROP TABLE IF EXISTS `msrsurvey`.`Commits`;
CREATE TABLE `Commits` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `identifier` TEXT NOT NULL,
    `project` INT NOT NULL,
    `author` INT NOT NULL,
    `committer` INT NOT NULL,
    `date` TEXT NOT NULL,
    `title` TEXT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY(`project`) REFERENCES Projects ( id ),
    FOREIGN KEY(`author`) REFERENCES Identities ( id ),
    FOREIGN KEY(`committer`) REFERENCES Identities ( id )
);

DROP TABLE IF EXISTS `msrsurvey`.`Identities`;
CREATE TABLE `Identities` (
    id INTEGER AUTO_INCREMENT NOT NULL,
    name TEXT NOT NULL,
    mail TEXT,
    user INTEGER NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY(user) REFERENCES Users (id)
);

DROP TABLE IF EXISTS `msrsurvey`.`SurveyResults`;
CREATE TABLE `SurveyResults` (
    id                          INTEGER                 NOT NULL,
    sw_adaptive                 BOOLEAN                 NOT NULL,
    sw_corrective               BOOLEAN                 NOT NULL,
    sw_perfective               BOOLEAN                 NOT NULL,
    nfr_maintainability         BOOLEAN                 NOT NULL,
    nfr_usability               BOOLEAN                 NOT NULL,
    nfr_functionality           BOOLEAN                 NOT NULL,
    nfr_reliability             BOOLEAN                 NOT NULL,
    nfr_efficiency              BOOLEAN                 NOT NULL,
    nfr_portability             BOOLEAN                 NOT NULL,
    nfr_none                    BOOLEAN                 NOT NULL,
    hl_forward                  BOOLEAN                 NOT NULL,
    hl_reengineering            BOOLEAN                 NOT NULL,
    hl_corrective               BOOLEAN                 NOT NULL,
    hl_management               BOOLEAN                 NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY(id) REFERENCES Commits (id)
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
