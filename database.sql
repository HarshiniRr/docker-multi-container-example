
DROP DATABASE IF EXISTS `dmce`;
CREATE DATABASE `dmce`;

GRANT USAGE ON *.* TO `dmce`@`%`;
DROP USER `dmce`@`%`;
GRANT ALL ON `dmce`.* TO `dmce`@`%` IDENTIFIED BY 'foobar';
FLUSH PRIVILEGES;

USE `dmce`;

CREATE TABLE `items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `items` (`name`) VALUES ('Test Item 1'), ('Test Item 2'), ('Test Item 3');