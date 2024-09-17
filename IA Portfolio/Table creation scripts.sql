

use hammad;

CREATE TABLE DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id);

     SELECT COUNT(*)
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id)
     INTO p_film_count;
END$$
DELIMITER ;
 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    organisation_name VARCHAR(255) NOT NULL,
    contact_first_name VARCHAR(255) NOT NULL,
    contact_last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    preferred_contact_method ENUM('post', 'email') NOT NULL
);

CREATE TABLE Pool_Members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    work_address TEXT NOT NULL,
    home_address TEXT NOT NULL
);

CREATE TABLE Skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);

-- Pool Member Skills Table
CREATE TABLE Pool_Member_Skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pool_member_id INT NOT NULL,
    skill_id INT NOT NULL,
    experience_level VARCHAR(255) NOT NULL,
    FOREIGN KEY (pool_member_id) REFERENCES Pool_Members(id),
    FOREIGN KEY (skill_id) REFERENCES Skills(id)
);

CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DECIMAL(10, 2) NOT NULL,
    description TEXT NOT NULL,
    phase ENUM('design', 'development', 'testing', 'deployment', 'complete') NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(id)
);

CREATE TABLE Project_Skills (
    project_id INT NOT NULL,
    skill_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(id),
    FOREIGN KEY (skill_id) REFERENCES Skills(id)
);

CREATE TABLE Project_Assignments (
    project_id INT NOT NULL,
    pool_member_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(id),
    FOREIGN KEY (pool_member_id) REFERENCES Pool_Members(id)
);

CREATE TABLE Project_Milestones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    milestone_title VARCHAR(255) NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('pending', 'completed', 'overdue') NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(id)
);

CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE Department_Members (
    department_id INT NOT NULL,
    pool_member_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(id),
    FOREIGN KEY (pool_member_id) REFERENCES Pool_Members(id)
);
sys_config

INSERT INTO Skills (name, type) VALUES 
('Java', 'Backend'),
('JUnit', 'Testing'),
('JavaScript', 'Frontend'),
('React', 'Frontend'),
('SQL', 'Database'),
('Python', 'Backend');


INSERT INTO Pool_Members (first_name, last_name, email, phone_number, work_address, home_address) VALUES
('Alice', 'Smith', 'alice@example.com', '1234567890', '123 Work St.', '321 Home St.'),
('Bob', 'Johnson', 'bob@example.com', '0987654321', '456 Work Ave', '654 Home Ave');
('Imran', 'Chan', 'imran@example.com', '0987654321', 'wqwq43 Work Ave', '63354 Home Ave');
('Boby', 'jan', 'Boby@example.com', '0987654321', '45343436 Work Ave', '233654 Home Ave');

INSERT INTO Pool_Member_Skills (pool_member_id, skill_id, experience_level) VALUES
(1, 1, 'Expert'),
(1, 2, 'Intermediate'),
(2, 3, 'Beginner'),
(2, 4, 'Intermediate');


INSERT INTO Clients (organisation_name, contact_first_name, contact_last_name, email, address, preferred_contact_method) VALUES
('Tech Solutions', 'John', 'Doe', 'john.doe@example.com', '789 Business Rd.', 'email'),
('Innovatech', 'Jane', 'Roe', 'jane.roe@example.com', '456 Enterprise Blvd.', 'post');


INSERT INTO Projects (client_id,title, start_date, end_date, budget, description, phase) VALUES
(1,'Database Migration', '2024-08-13', '2024-12-31', 2000, 'A project to develop a new web application.', 'development');
(2,'Software development', '2024-09-14', '2024-12-31', 9000, 'A project to deveployment a Software development.', 'deployment');
(4,'Front End', '2024-10-07', '2024-12-31', 400, 'A project to develop a new web application.', 'testing');
(6,'Back End', '2024-12-02', '2024-12-31', 10000000, 'A project to develop a new web application.', 'complete');

INSERT INTO `hammad`.`project_assignments`
(`project_id`,
`pool_member_id`)
VALUES
(3,
4);
