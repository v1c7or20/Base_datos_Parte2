---Tablas  de Base de Datos: Projecto 2020-1.

---Integrantes:
---Felix Blanco
---Victor Peña
---Renzo Tenazoa

CREATE TABLE Users(
    id BIGINT PRIMARY KEY,
    imagen VARCHAR(255),
    Username VARCHAR(255)
);

CREATE TABLE Record(
    id BIGINT PRIMARY KEY,
    player VARCHAR(255),
    Catchs DATE,
    time_record TIME
);

CREATE TABLE Course(
    id BIGINT PRIMARY KEY,
    thumbnail VARCHAR(256),
    creation DATE
);

CREATE TABLE Country(
    cname VARCHAR(255),
    flag VARCHAR(255),
    PRIMARY KEY (cname)
);

CREATE TABLE Metadata(
    Course_id BIGINT,
    first_clear VARCHAR(255),
    tag VARCHAR(255),
    starts INT,
    player_tweets INT,
    clears INT,
    attemps INT,
    clear_rate FLOAT,
    FOREIGN KEY (Course_id) REFERENCES Course (id)
);

CREATE TABLE MarioVersion(
    difficulty VARCHAR(255),
    Course_id BIGINT,
    FOREIGN KEY (Course_id) REFERENCES Course(id) 
);

CREATE TABLE MarioBros(
    game_style VARCHAR(255) PRIMARY KEY,
    mversion VARCHAR(255),
    difficulty VARCHAR(255)
);


CREATE TABLE MarioWorld(
    game_style VARCHAR(255) PRIMARY KEY,
    año INT,
    difficulty VARCHAR(255)
);

CREATE TABLE MarioBrosU(
    game_style VARCHAR(255) PRIMARY KEY,
    isBeta BOOLEAN,
    difficulty VARCHAR(255)
);

CREATE TABLE Uses (
    Course_id BIGINT,
    FOREIGN KEY (Course_id) REFERENCES Course(id) 
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


