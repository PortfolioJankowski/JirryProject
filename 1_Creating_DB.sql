CREATE DATABASE mngDB;
use mngDB
-- From within the mngDB database, I create the tables in the database that will be required for project management

-- adding one user and one administrator
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20),
    lastname VARCHAR(20),
    email VARCHAR(50),
    password VARCHAR(20),
    type CHAR(1) CHECK (type IN ('U', 'A'))
);

INSERT INTO users (name, lastname, email, type, password)
VALUES ('Mateusz', 'Jankowski', 'mat.jankowski99@gmail.com', 'A', 'ABC123');

INSERT INTO users (name, lastname, email, type,password)
VALUES ('Jan', 'Kowalski', 'jan.kowalski@gmail.com', 'U', '123ABC');

-- I create a table with projects, in which there will be the id of the project, the id of the user running the project, the name of the project, the description of the project
-- project start date and end date


CREATE TABLE projects (
     id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
	project_name varchar(50),
    description VARCHAR(300),
    start_date DATE,
    end_date DATE,
	status varchar(13) CHECK (status IN ('completed', 'in progress', 'to do'))
    FOREIGN KEY (user_id) REFERENCES users(id)
	
);

CREATE TABLE Tasks (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    project_id INT,
    description VARCHAR(300),
    start_date DATE,
    end_date DATE,
    status varchar(13) CHECK (status IN ('completed', 'in progress', 'to do'))
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id),
   
);

CREATE TABLE Bugs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    project_id INT,
    task_id INT,
    description VARCHAR(300),
    status varchar(13) CHECK (status IN ('completed', 'in progress', 'to do')),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (task_id) REFERENCES Tasks(id)
);


