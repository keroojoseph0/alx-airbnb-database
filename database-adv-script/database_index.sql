USE airbnb_db;

CREATE INDEX idx_users_first_name_last_name ON users(first_name, last_name);
CREATE INDEX idx_users_email ON users(email);

CREATE INDEX idx_properties_name ON properties(name);

CREATE INDEX idx_bookings_status ON bookings(status);

EXPLAIN ANALYZE SELECT first_name, last_name FROM users;
EXPLAIN SELECT email FROM users;

EXPLAIN ANALYZE SELECT name FROM properties;
EXPLAIN SELECT status FROM bookings;

SHOW INDEXES FROM users;
SHOW INDEXES FROM properties;
SHOW INDEXES FROM bookings;