-- Создание базы данных
CREATE DATABASE sports_competition;

-- Таблица районов
CREATE TABLE Districts (
    district_id INT PRIMARY KEY,
    district_name VARCHAR(100),
    area VARCHAR(100)
);

-- Таблица спортсменов
CREATE TABLE Athletes (
    athlete_id INT PRIMARY KEY,
    athlete_name VARCHAR(150),
    age INT,
    district_id INT NOT NULL REFERENCES Districts(district_id)
);

-- Таблица видов спорта
CREATE TABLE Sports (
    sport_id INT PRIMARY KEY,
    sport_name VARCHAR(100),
    description TEXT,
    rules TEXT
);

-- Таблица этапов соревнований
CREATE TABLE Stages (
    stage_id INT PRIMARY KEY,
    stage_name VARCHAR(150),
    date DATE,
    district_id INT NOT NULL REFERENCES Districts(district_id)
);

-- Таблица результатов
CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    athlete_id INT NOT NULL REFERENCES Athletes(athlete_id),
    stage_id INT NOT NULL REFERENCES Stages(stage_id),
    sport_id INT NOT NULL REFERENCES Sports(sport_id),
    score DECIMAL(5, 2),
    place INT
);
