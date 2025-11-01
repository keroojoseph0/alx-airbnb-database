USE airbnb_db;

-- ==============================
-- partitioning on the Booking table based on the start_date column
-- ==============================


CREATE TABLE bookings_partitioned (
  booking_id INT NOT NULL,
  user_id INT,
  property_id INT,
  start_date DATE NOT NULL,
  end_date DATE,
  total_price DECIMAL(10,2),
  status VARCHAR(50),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE COLUMNS (start_date) (
  PARTITION p2025_12_01 VALUES LESS THAN ('2025-12-01'),
  PARTITION p2025_12_20 VALUES LESS THAN ('2025-12-20'),
  PARTITION pmax VALUES LESS THAN (MAXVALUE)
);

INSERT INTO bookings_partitioned SELECT * FROM bookings;

SELECT PARTITION_NAME, PARTITION_DESCRIPTION
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'bookings';
