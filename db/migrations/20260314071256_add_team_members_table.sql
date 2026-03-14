-- +goose Up
CREATE TABLE IF NOT EXISTS team_members(
    id INT AUTO_INCREMENT PRIMARY KEY,
    registration_id INT NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    college VARCHAR(150),
    is_leader BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (registration_id) REFERENCES registration(id) ON DELETE CASCADE
);

-- +goose Down
DROP TABLE IF EXISTS team_members;
