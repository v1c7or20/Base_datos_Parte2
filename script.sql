---Tablas  de Base de Datos: Projecto 2020-1.

---Integrantes:
---Felix Blanco
---Victor Peña
---Renzo Tenazoa

CREATE TABLE Users(
    id VARCHAR(50) UNIQUE NOT NULL,
    imagen VARCHAR(255) NOT NULL ,     
    Username VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Record(
    id VARCHAR(50) PRIMARY KEY,
    Catchs DATE NOT NULL,
    time_record INT NOT NULL
);

CREATE TABLE Course(
    id VARCHAR(50) PRIMARY KEY,
    thumbnail VARCHAR(255) NOT NULL,
    creation DATE NOT NULL,
    version_m VARCHAR(15) NOT NULL,
    difficulty VARCHAR(15) NOT NULL
);

CREATE TABLE Country(
    flag VARCHAR(3) PRIMARY KEY,
    cname VARCHAR(50) NOT NULL
); 

CREATE TABLE Metadata(
    Course_id VARCHAR(50),
    tag VARCHAR(255) ,
    starts INT  DEFAULT 0 NOT NULL ,
    player_tweets INT DEFAULT 0 NOT NULL,
    clears INT DEFAULT 0 NOT NULL,
    attemps INT DEFAULT 0 NOT NULL,
    clear_rate FLOAT DEFAULT 0 NOT NULL,
    FOREIGN KEY (Course_id) REFERENCES Course (id)
);

CREATE TABLE Creates(
    Course_id VARCHAR(50),
    Maker_id VARCHAR(50),
    FOREIGN KEY (Course_id) REFERENCES Course(id),
    FOREIGN KEY (Maker_id) REFERENCES Users(Username)
);

CREATE TABLE User_From(
    Country_name VARCHAR(255),
    User_id VARCHAR(50),
    FOREIGN KEY (Country_name) REFERENCES Country(flag),
    FOREIGN KEY (User_id) REFERENCES Users(Username)
);


CREATE TABLE Plays(
    User_id VARCHAR(50),
    Course_id VARCHAR(50),
    FOREIGN KEY (User_id) REFERENCES Users(Username),
    FOREIGN KEY (Course_id) REFERENCES Course(id)
);

CREATE TABLE Likes(
    User_id VARCHAR(50),
    Course_id VARCHAR(50),
    FOREIGN KEY (User_id) REFERENCES Users(Username),
    FOREIGN KEY (Course_id) REFERENCES Course(id)
);

CREATE TABLE Has(
    User_id VARCHAR(50),
    Course_id VARCHAR(50),
    Record_id VARCHAR(50),
    FOREIGN KEY (User_id) REFERENCES Users(Username),
    FOREIGN KEY (Course_id) REFERENCES Course(id),
    FOREIGN KEY (Record_id) REFERENCES Record(id)
); 


--- comando: COPY Country(flag, cname) <<tabla
---             FROM '/home/asus/Documents/Code/Base_datos_Parte2/FilesDivided/10000/countries.csv' <<path DELIMITER E'\t' CSV HEADER;