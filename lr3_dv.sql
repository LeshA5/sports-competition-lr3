-- Создание базы данных
CREATE DATABASE sports_competition;

-- ===== ХАБ-ТАБЛИЦЫ =====
CREATE TABLE Hub_Districts (
    district_id INT PRIMARY KEY
);

CREATE TABLE Hub_Athletes (
    athlete_id INT PRIMARY KEY
);

CREATE TABLE Hub_Sports (
    sport_id INT PRIMARY KEY
);

CREATE TABLE Hub_Stages (
    stage_id INT PRIMARY KEY
);

-- ===== ЛИНК-ТАБЛИЦЫ =====
CREATE TABLE Lnk_Results (
    result_id INT PRIMARY KEY,
    athlete_id INT NOT NULL REFERENCES Hub_Athletes(athlete_id),
    stage_id INT NOT NULL REFERENCES Hub_Stages(stage_id),
    sport_id INT NOT NULL REFERENCES Hub_Sports(sport_id),
    load_date DATE
);

-- ===== САТЕЛЛИТ-ТАБЛИЦЫ =====
CREATE TABLE Sat_Districts (
    district_id INT NOT NULL REFERENCES Hub_Districts(district_id),
    district_name VARCHAR(100),
    area VARCHAR(100)
);

CREATE TABLE Sat_Athletes (
    athlete_id INT NOT NULL REFERENCES Hub_Athletes(athlete_id),
    athlete_name VARCHAR(150),
    age INT
);

CREATE TABLE Sat_Sports (
    sport_id INT NOT NULL REFERENCES Hub_Sports(sport_id),
    sport_name VARCHAR(100),
    description TEXT,
    rules TEXT
);

CREATE TABLE Sat_Stages (
    stage_id INT NOT NULL REFERENCES Hub_Stages(stage_id),
    stage_name VARCHAR(150),
    date DATE
);

CREATE TABLE Sat_Results (
    result_id INT NOT NULL REFERENCES Lnk_Results(result_id),
    score DECIMAL(5, 2),
    place INT
);
