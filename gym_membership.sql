DROP TABLE IF EXISTS gym_members CASCADE;
DROP TABLE IF EXISTS membership_types CASCADE;
DROP TABLE IF EXISTS gym_classes CASCADE;
DROP TABLE IF EXISTS class_registrations CASCADE;

CREATE TABLE membership_types(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    type_name TEXT NOT NULL,
    type_description TEXT NOT NULL,
    monthly_fee INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE gym_members(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NULL,
    phone_number TEXT NOT NULL,
    date_of_birth DATE NULL,
    membership_start_date DATE NOT NULL,
    membership_end_date DATE NULL,
    membership_type_id BIGINT NOT NULL REFERENCES membership_types(id),
    membership_status TEXT NOT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE gym_classes(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    class_name TEXT NOT NULL,
    instructor TEXT NOT NULL,
    schedule TEXT NOT NULL,
    duration INT NOT NULL,
    capacity INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE class_registrations(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    member_id BIGINT NOT NULL REFERENCES gym_members(id),
    class_id BIGINT NOT NULL REFERENCES gym_classes(id),
    registration_date DATE NOT NULL,
    PRIMARY KEY(id)
);



INSERT INTO membership_types (type_name, type_description, monthly_fee)
VALUES
('Standard', '10h allowance per week', 20),
('Premium', '20h allowance per week', 40),
('Gold', '100h allowance per week', 100);

INSERT INTO gym_members (first_name, last_name, email, phone_number, date_of_birth, membership_start_date, membership_end_date, membership_type_id, membership_status)
VALUES
('Milla', 'Sukki', 'mömmö@gmail.com', '0411234567', '2000-10-10', '2025-01-01', NULL, 3, 'Active'),
('Kassu', 'Kissu', 'kassunmaili@gmail.com', '0411235267', '1800-10-10', '2025-01-01', NULL, 1, 'Active'),
('Leevi', 'Leijona', 'leeeeevi@gmail.com', '041827567', '1998-05-10', '2025-01-01', NULL, 2, 'Active');

INSERT INTO gym_classes (class_name, instructor, schedule, duration, capacity)
VALUES
('Bodypump', 'Nita', 'Monday 2pm', 60, 20),
('Cycling HIIT', 'Pekkis', 'Friday 6pm', 45, 20),
('Hot Yoga', 'Juha', 'Wednesday 4pm', 75, 30);

INSERT INTO class_registrations (member_id, class_id, registration_date)
VALUES
(1, 3, '2025-01-23'),
(2, 2, '2025-01-20'),
(3, 1, '2025-01-10');


