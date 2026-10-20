-- Starter schema for the General Knowledge Game.
-- Create the database before importing this file:
-- CREATE DATABASE general_knowledge CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE j_user (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    userID VARCHAR(254) NOT NULL,
    passwrd VARCHAR(255) NOT NULL,
    score INT NOT NULL DEFAULT 0,
    last_login DATETIME NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_j_user_userID (userID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE j_category (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE j_value (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    value INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_j_value_value (value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE j_question (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    question TEXT NOT NULL,
    answer VARCHAR(500) NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    value_id INT UNSIGNED NOT NULL,
    is_answered TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    KEY idx_j_question_category (category_id),
    CONSTRAINT fk_j_question_category FOREIGN KEY (category_id)
        REFERENCES j_category (id) ON DELETE CASCADE,
    CONSTRAINT fk_j_question_value FOREIGN KEY (value_id)
        REFERENCES j_value (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE j_game_states (
    userID INT UNSIGNED NOT NULL,
    game_state JSON NULL,
    PRIMARY KEY (userID),
    CONSTRAINT fk_j_game_states_user FOREIGN KEY (userID)
        REFERENCES j_user (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO j_category (title) VALUES ('General Knowledge');
INSERT INTO j_value (value) VALUES (100), (200), (300);

INSERT INTO j_question (question, answer, category_id, value_id) VALUES
    ('What is the largest planet in our solar system?', 'Jupiter', 1, 1),
    ('Which element has the chemical symbol O?', 'Oxygen', 1, 2),
    ('What is the capital city of Japan?', 'Tokyo', 1, 3);
