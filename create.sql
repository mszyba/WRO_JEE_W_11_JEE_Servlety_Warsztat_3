CREATE DATABASE workshop2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE users (
                       id INT(11) NOT NULL AUTO_INCREMENT,
                       username VARCHAR(255) DEFAULT NULL,
                       email VARCHAR(255) DEFAULT NULL UNIQUE,
                       password VARCHAR(255) DEFAULT NULL,
                       PRIMARY KEY (id)
);
