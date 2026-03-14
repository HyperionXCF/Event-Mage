-- +goose Up
CREATE TABLE IF NOT EXISTS payments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    registration_id INT NOT NULL UNIQUE,
    amount DECIMAL(10,2) NOT NULL, 
    status ENUM('pending','paid','failed','refunded') DEFAULT 'pending',
    transaction_id VARCHAR(255),
    paid_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

-- +goose Down
DROP TABLE IF EXISTS payments;
