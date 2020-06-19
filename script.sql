---Tablas  de Base de Datos: Projecto 2020-1.

---Integrantes:
---Felix Blanco
---Victor Peña
---Renzo Tenazoa

CREATE TABLE Users(
    id BIGINT PRIMARY KEY,  -- VARCHAR cambiar en el overleaf
    imagen VARCHAR(255),     
    Username VARCHAR(50)
);

CREATE TABLE Record(
    id BIGINT PRIMARY KEY, -- VARCHAR cambiar en el overleaf
    player VARCHAR(50),
    Catchs DATE,    -- cambiar en el overleaf
    time_record INT    -- INT cambiar en el overleaf
);

CREATE TABLE Course(
    id BIGINT PRIMARY KEY, -- VARCHAR
    thumbnail VARCHAR(255), -- VARCHAR cambiar en el overleaf
    creation DATE   -- eliminar del diccionario difficulty
);

CREATE TABLE Country(
    cname VARCHAR(50) PRIMARY KEY,
    flag VARCHAR(3),
);

CREATE TABLE Metadata(
    Course_id BIGINT,   -- VARCHAR cambiar en el overleaf
    first_clear VARCHAR(50), -- foreign key, cambiar en el overleaf
    tag VARCHAR(255), -- INT cambiar en el overleaf
    starts INT,
    player_tweets INT,
    clears INT,
    attemps INT,
    clear_rate FLOAT,
    FOREIGN KEY (Course_id) REFERENCES Course (id)
    FOREIGN KEY (first_clear) REFERENCES Users (Username)
);

CREATE TABLE MarioVersion(
    difficulty VARCHAR(15),
    Course_id BIGINT,   -- Añadir en el overleaf
    FOREIGN KEY (Course_id) REFERENCES Course(id) 
);

CREATE TABLE MarioBros(
    game_style VARCHAR(20) PRIMARY KEY, -- Añadir en el oveleaf
    mversion VARCHAR(30), -- Cambiar en el overleaf
    difficulty VARCHAR(15)
);


CREATE TABLE MarioWorld(
    game_style VARCHAR(20) PRIMARY KEY, -- Añadir en el oveleaf
    año INT,    -- Cambiar en el oveleaf
    difficulty VARCHAR(15) 
);

CREATE TABLE MarioBrosU(
    game_style VARCHAR(20) PRIMARY KEY,
    isBeta BOOLEAN,
    difficulty VARCHAR(15)
);

-- Cambiarlo en overlaf, desde AQUÍ

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


