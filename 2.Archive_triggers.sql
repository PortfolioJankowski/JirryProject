-- project archive

CREATE TABLE proj_archive (
    archive_id INT IDENTITY(1,1) PRIMARY KEY,
    operation_type VARCHAR(20), )
    project_id INT, 
    user_id INT, 
    project_name VARCHAR(50),
    description VARCHAR(300),
    start_date DATE,
    end_date DATE,
    status VARCHAR(13),
    archive_timestamp DATETIME
);

-- trigger that will create an archive of projects
CREATE TRIGGER trg_projects_archive
ON projects
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        -- Adding new records (INSERT)
        INSERT INTO proj_archive (operation_type, project_id, user_id, project_name, description, start_date, end_date, status, archive_timestamp)
        SELECT 'insert', id, user_id, project_name, description, start_date, end_date, status, GETDATE()
        FROM inserted
    END

    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        -- Updating or deleting existing records (UPDATE or DELETE)
        INSERT INTO proj_archive (operation_type, project_id, user_id, project_name, description, start_date, end_date, status, archive_timestamp)
        SELECT 'update', d.id, d.user_id, d.project_name, d.description, d.start_date, d.end_date, d.status, GETDATE()
        FROM deleted d
        INNER JOIN inserted i ON d.id = i.id
        WHERE
            NOT EXISTS (SELECT 1 FROM proj_archive pa WHERE pa.project_id = d.id AND pa.operation_type = 'update')
        
        INSERT INTO proj_archive (operation_type, project_id, user_id, project_name, description, start_date, end_date, status, archive_timestamp)
        SELECT 'delete', id, user_id, project_name, description, start_date, end_date, status, GETDATE()
        FROM deleted
        WHERE
            NOT EXISTS (SELECT 1 FROM proj_archive pa WHERE pa.project_id = deleted.id AND pa.operation_type = 'delete')
    END
END;

-- User archive
CREATE TABLE archive_users (
    archive_id INT IDENTITY(1,1) PRIMARY KEY,
    operation_type VARCHAR(20), -- Type of operation (e.g. 'insert', 'update', 'delete')
    user_id INT, -- User ID
    name VARCHAR(20),
    lastname VARCHAR(20),
    email VARCHAR(50),
    password VARCHAR(20),
    type CHAR(1),
    archive_timestamp DATETIME  -- Date and time of archiving operation
);

-- Creating a trigger for the users table
CREATE TRIGGER trg_users_archive
ON users
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
         -- Adding new records (INSERT)
        INSERT INTO archive_users (operation_type, user_id, name, lastname, email, password, type, archive_timestamp)
        SELECT 'insert', id, name, lastname, email, password, type, GETDATE()
        FROM inserted
    END

    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
		-- Updating or deleting existing records (UPDATE or DELETE)
        INSERT INTO archive_users (operation_type, user_id, name, lastname, email, password, type, archive_timestamp)
        SELECT 'update', d.id, d.name, d.lastname, d.email, d.password, d.type, GETDATE()
        FROM deleted d
        INNER JOIN inserted i ON d.id = i.id
        WHERE
            NOT EXISTS (SELECT 1 FROM archive_users au WHERE au.user_id = d.id AND au.operation_type = 'update')
        
        INSERT INTO archive_users (operation_type, user_id, name, lastname, email, password, type, archive_timestamp)
        SELECT 'delete', id, name, lastname, email, password, type, GETDATE()
        FROM deleted
        WHERE
            NOT EXISTS (SELECT 1 FROM archive_users au WHERE au.user_id = deleted.id AND au.operation_type = 'delete')
    END
END;

