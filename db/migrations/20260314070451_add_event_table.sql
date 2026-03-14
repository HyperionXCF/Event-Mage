-- +goose Up
CREATE TABLE IF NOT EXISTS event(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    banner_url VARCHAR(500),
    rules_pdf_url VARCHAR(500),
    prize_pool DECIMAL(10,2) DEFAULT 0.00,
    registration_fee DECIMAL(10,2) DEFAULT 0.00,
    min_team_size INT NOT NULL DEFAULT 1,
    max_team_size INT NOT NULL DEFAULT 1,
    event_date DATETIME NOT NULL, 
    registration_deadline DATETIME NOT NULL, 
    created_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (created_by) REFERENCES user(id)
);

-- +goose Down
DROP TABLE IF EXISTS event;
