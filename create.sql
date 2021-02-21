CREATE DATABASE workshop2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE users (
                       id INT(11) NOT NULL AUTO_INCREMENT,
                       username VARCHAR(255) DEFAULT NULL,
                       email VARCHAR(255) DEFAULT NULL UNIQUE,
                       password VARCHAR(255) DEFAULT NULL,
                       PRIMARY KEY (id)
);

INSERT INTO users (username, email, password) VALUES
('Harry Poter',  'harry@wp.pl', 'dsd87sd65d#$'),
('Harry Hole',  'harry@hole.com', 'dsd5trdsd65d#$'),
('John Wick',  'john@gmail.com', 'fr3wsdsd65d#$'),
('Jake Wood',  'jakewood@gmail.com', 'fr3d65d#$'),
('John Deree',  'dere@hotmail.com', 'FDGTdds3d65d#$'),
('Ann Moss',  'thebest@mail.com', '#DG7ussd578jyj'),
('Thomas Anderson',  'neo@matrix.com', '#DG7usdscsd578jyj'),
('Keanu Reeves',  'neo99@matrix.com', '#Dds43edssd578jyj');