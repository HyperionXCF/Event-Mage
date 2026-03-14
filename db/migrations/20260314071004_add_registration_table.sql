-- +goose Up
CREATE TABLE IF NOT EXISTS registration(
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    leader_id INT NOT NULL,                           
    type ENUM('individual', 'team') NOT NULL,
    team_name VARCHAR(100),
    payment_status ENUM('pending', 'paid', 'failed', 'cancelled') DEFAULT 'pending',
    amount_paid DECIMAL(10,2) DEFAULT 0.00,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (event_id)  REFERENCES event(id),
    FOREIGN KEY (leader_id) REFERENCES user(id),

    -- one leader cannot register for same event twice
    UNIQUE KEY unique_leader_event (leader_id, event_id)
);

-- +goose Down
DROP TABLE IF EXISTS registration;
