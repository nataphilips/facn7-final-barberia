BEGIN;
  DROP TABLE IF EXISTS bookings, services, working_schedule CASCADE;

  CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    description TEXT,
    service_cost INTEGER NOT NULL DEFAULT 0,
    service_duration INTEGER NOT NULL DEFAULT 30
  );


  CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    booking_date VARCHAR(100) NOT NULL,
    booking_time VARCHAR(100) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_phone VARCHAR(100) NOT NULL,
    service_id INTEGER DEFAULT 1,
    FOREIGN KEY (service_id) REFERENCES services(service_id)
  );

  CREATE TABLE working_schedule (
    schedule_id SERIAL PRIMARY KEY,
    week_day INTEGER NOT NULL,
    start_hr VARCHAR(100) NOT NULL,
    end_hr VARCHAR(100) NOT NULL
  );

  INSERT INTO services (service_name, description, service_cost, service_duration)
    VALUES ('Regular haircut','Regular haircut <br /> shampoo', 40, 30);

  INSERT INTO bookings (booking_date, booking_time, customer_email, customer_name, customer_phone, service_id)
    VALUES ('20191124', '0900', 'ghj@g.com ', 'Itay', '0544791675', 1);

  INSERT INTO working_schedule (week_day, start_hr, end_hr)
    VALUES (0, '0900', '2100');

COMMIT;
