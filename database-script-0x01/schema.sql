-- Enable UUID support (MySQL uses UUID() function, no extension needed)

-- Create the database (optional)
CREATE DATABASE IF NOT EXISTS airbnb_db;
USE airbnb_db;

-- ===============================
-- USERS TABLE
-- ===============================
CREATE TABLE users (
    user_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),      -- UUID for unique user ID
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster email lookup
CREATE INDEX idx_users_email ON users (email);


-- ===============================
-- PROPERTIES TABLE
-- ===============================
CREATE TABLE properties (
    property_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),   -- UUID for property
    host_id CHAR(36) NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
);

-- Indexes for performance
CREATE INDEX idx_properties_host_id ON properties (host_id);
CREATE INDEX idx_properties_location ON properties (location);


-- ===============================
-- BOOKINGS TABLE
-- ===============================
CREATE TABLE bookings (
    booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),   -- UUID for booking
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Indexes for performance
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);


-- ===============================
-- PAYMENTS TABLE
-- ===============================
CREATE TABLE payments (
    payment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),   -- UUID for payment
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Index for performance
CREATE INDEX idx_payments_booking_id ON payments (booking_id);


-- ===============================
-- REVIEWS TABLE
-- ===============================
CREATE TABLE reviews (
    review_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),    -- UUID for review
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Indexes for performance
CREATE INDEX idx_reviews_property_id ON reviews (property_id);
CREATE INDEX idx_reviews_user_id ON reviews (user_id);

