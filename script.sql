---Tablas  de Base de Datos: Projecto 2020-1.

---Integrantes:
---Felix Blanco
---Victor Peña
---Renzo Tenazoa

CREATE TABLE Users(
    id VARCHAR(50) PRIMARY KEY,
    imagen VARCHAR(255),     
    Username VARCHAR(50)
);

CREATE TABLE Record(
    id VARCHAR(50) PRIMARY KEY,
    player VARCHAR(50),
    Catchs DATE,
    time_record INT
);

CREATE TABLE Course(
    id VARCHAR(50) PRIMARY KEY,
    thumbnail VARCHAR(255),
    creation DATE,
    version_m VARCHAR(15),
    difficulty VARCHAR(15)
);

CREATE TABLE Country(
    cname VARCHAR(50) PRIMARY KEY,
    flag VARCHAR(3),
);

CREATE TABLE Metadata(
    Course_id VARCHAR(50),
    first_clear VARCHAR(50),
    tag VARCHAR(255),
    starts INT,
    player_tweets INT,
    clears INT,
    attemps INT,
    clear_rate FLOAT,
    FOREIGN KEY (Course_id) REFERENCES Course (id)
    FOREIGN KEY (first_clear) REFERENCES Users (Username)
);

CREATE TABLE Creates(
    Course_id BIGINT,
    Maker_id BIGINT,
    FOREIGN KEY (Course_id) REFERENCES Course(id),
    FOREIGN KEY (Maker_id) REFERENCES Users(id)
);

CREATE TABLE User_From(
    Country_name VARCHAR(255),
    User_id INT,
    FOREIGN KEY (Country_name) REFERENCES Country(cname),
    FOREIGN KEY (User_id) REFERENCES Users(id)
);


CREATE TABLE Plays(
    User_id BIGINT,
    Course_id BIGINT,
    FOREIGN KEY (User_id) REFERENCES Users(id),
    FOREIGN KEY (Course_id) REFERENCES Course(id)
);

CREATE TABLE Likes(
    User_id BIGINT,
    Course_id BIGINT,
    FOREIGN KEY (User_id) REFERENCES Users(id),
    FOREIGN KEY (Course_id) REFERENCES Course(id)
);

CREATE TABLE Has(
    User_id BIGINT,
    Course_id BIGINT,
    Record_id BIGINT,
    FOREIGN KEY (User_id) REFERENCES Users(id),
    FOREIGN KEY (Course_id) REFERENCES Course(id),
    FOREIGN KEY (Record_id) REFERENCES Record(id)
);


