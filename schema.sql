CREATE DATABASE employee;

CREATE TABLE Employee(
	employee_id INT NOT NULL,
    employee_name CHAR(40),
    department CHAR(20),
    join_date DATETIME NOT NULL,
    location VARCHAR(200),
    PRIMARY KEY (employee_id)
);

CREATE TABLE Program(
	program_id INT NOT NULL,
    program_name VARCHAR(20),
    start_date DATETIME,
    end_date DATETIME,
    PRIMARY KEY (program_id)
);

CREATE TABLE Participation(
	partication_id INT NOT NULL,
    employee_id int,
    program_id int,
    points_earned int,
    
    PRIMARY KEY(participation_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Rewards(
	reward_id int NOT NULL,
	reward_name varchar(40),
    points_required int,
    PRIMARY KEY (reward_id)
);

CREATE TABLE Redemption(
	redemption_id int NOT NULL,
    employee_id int,
    reward_id int,
    redeem_date datetime,
    PRIMARY KEY (redemption_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (reward_id) REFERENCES Rewards(reward_id)
);

INSERT INTO Employee (employee_id, employee_name, department, join_date, location) 
VALUES (1, 'Amit Sharma', 'Enginerring', '2021-02-10', 'Guwahati'),
(2, 'Riya Sen', 'Marketing', '2020-11-05', 'Bangalore'),
(3, 'Rohan Das', 'Product', '2022-03-15', 'Delhi'),
(4, 'Sneha Gupta', 'Engineering', '2019-07-22', 'Hyderabad'),
(5, 'Kunal Verma', 'HR', '2021-12-01', 'Guwahati'),
(6, 'Megha Thakur', 'Sales', '2022-06-18', 'Mumbai'),
(7, 'Arjun Mehta', 'Engineering', '2023-01-12', 'Pune'),
(8, 'Nidhi Agarwal', 'Finance', '2020-09-10', 'Kolkata'),
(9, 'Vivek Rao', 'Marketing', '2021-10-03', 'Hyderabad'),
(10, 'Priya Singh', 'Product', '2022-08-25', 'Guwahati');

INSERT INTO Program (program_id, program_name, start_date, end_date)
VALUES (1, 'Yoga Wellness Week', '2024-01-05', '2024-01-10'),
(2, 'Tech Hackathon', '2024-02-12', '2024-02-14'),
(3, 'Mental Health Webinar', '2024-03-01', '2024-03-01'),
(4, 'Fitness Challenge', '2024-04-01', '2024-04-30'),
(5, 'Coding Bootcamp', '2024-05-10', '2024-05-20'),
(6, 'Team Building Retreat', '2024-06-15', '2024-06-16');

INSERT INTO Participation (participation_id, employee_id) 
VALUES (1, 1, 1, 20),
(2, 1, 2, 50),
(3, 1, 4, 40),
(4, 2, 1, 15),
(5, 2, 3, 30),
(6, 2, 6, 25),
(7, 3, 2, 45),
(8, 3, 5, 60),
(9, 3, 6, 35),
(10, 4, 4, 50),
(11, 4, 5, 70),
(12, 4, 6, 40),
(13, 5, 3, 20),
(14, 5, 4, 35),
(15, 6, 1, 10),
(16, 6, 2, 40),
(17, 7, 5, 55),
(18, 7, 6, 30),
(19, 8, 3, 25),
(20, 9, 4, 45),
(21, 9, 6, 30),
(22, 10, 2, 35),
(23, 10, 5, 65),
(24, 3, 4, 40),
(25, 4, 1, 20),
(26, 7, 1, 15),
(27, 9, 3, 25),
(28, 10, 1, 20),
(29, 5, 6, 30),
(30, 2, 2, 40);

INSERT INTO Rewards (rewards_id, reward_name, points_required)
VALUES (1, 'Amazon Gift Card ₹500', 80),
(2, 'Swiggy Voucher ₹300', 50),
(3, 'Starbucks Drink Coupon', 40),
(4, 'Fitness Band', 150),
(5, 'Movie Tickets (2)', 70),
(6, 'Company Hoodie', 100);

INSERT INTO Redemption (redemption_id, employee_id, reward_id, redeem_date)
VALUES (1, 1, 1, '2024-02-20'),
(2, 1, 3, '2024-03-05'),

(3, 2, 2, '2024-04-10'),
(4, 2, 5, '2024-05-01'),

(5, 3, 4, '2024-06-02'),

(6, 4, 1, '2024-01-15'),
(7, 4, 6, '2024-03-20'),

(8, 5, 2, '2024-04-28'),

(9, 6, 3, '2024-02-25'),

(10, 7, 5, '2024-05-15'),

(11, 8, 3, '2024-03-12'),
(12, 8, 2, '2024-04-19'),

(13, 9, 1, '2024-03-30'),

(14, 10, 6, '2024-06-10'),
(15, 10, 2, '2024-04-04');