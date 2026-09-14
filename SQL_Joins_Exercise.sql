----CREATING TABLES
---- TABLE ONE USERS
CREATE TABLE IF NOT EXISTS users (
user_id INT,
user_name STRING,
country STRING
);

INSERT INTO users VALUES
(1,'Nomvula','Johannesburg'),
(2,'David','Cape Town'),
(3,'Anele','Durban'),
(4,'Kabelo','Pretoria'),
(5,'Lerato','Port Elizabeth');

-----TABLE 2 PLANS
CREATE TABLE IF NOT EXISTS plans (
plan_id INT,
plan_name STRING,
monthly_price INT
);
INSERT INTO plans VALUES
(10,'Basic',79),
(11,'Standard',129),
(12,'Premium',199),
(13,'Family',249),
(14,'Mobile',59);

----- TABLE 3 SUBSCRIPTIONS
CREATE TABLE IF NOT EXISTS subscriptions (
subscription_id INT,
user_id INT,
plan_id INT,
start_date DATE
);
INSERT INTO subscriptions VALUES
(501,1,10,'2026-01-15'),
(502,2,11,'2026-02-01'),
(503,1,12,'2026-03-10'),
(504,6, 11,'2026-03-20'),
(505,3,13,'2026-04-05');

----- TABLE 4 SHOWS
CREATE TABLE IF NOT EXISTS shows (
show_id INT,
show_title STRING,
genre STRING
);
INSERT INTO shows VALUES
(701,'ComedyHour','Comedy'),
(702,'CrimeTime','Drama'),
(703,'TechTales','Documentary'),
(704,'CookingLab','Lifestyle'),
(706,'WildEarth','Documentary');

------TABLE 5 VIEWING SESSIONS
CREATE TABLE IF NOT EXISTS viewing_sessions (
session_id INT,
user_id INT,
show_id INT,
watch_minutes INT
);
INSERT INTO viewing_sessions VALUES
(901,1,701,45),
(902,2,703,30),
(903,1,702,60),
(904,7,701,20),
(905,3,705,90);

-----SHOWING THE TABLES CREATED
SELECT*FROM users;
SELECT*FROM plans;
SELECT*FROM subscriptions;
SELECT*FROM shows;
SELECT*FROM viewing_sessions;

----- PART A: INNER JOINT
------ QUESTION 1

SELECT
u.user_id,
u.user_name,
s.subscription_id,
s.start_date
FROM users u
INNER JOIN subscriptions s
ON u.user_id = s.user_id;

----- QUESTION 2
SELECT
s.subscription_id,
s.user_id,
p.plan_name,
p.monthly_price
FROM subscriptions s
INNER JOIN plans p
ON s.plan_id = p.plan_id;

-----QUESTION 3
SELECT
vs.session_id,
vs.user_id,
sh.show_title,
sh.genre,
vs.watch_minutes
FROM viewing_sessions vs
INNER JOIN shows sh
ON vs.show_id = sh.show_id;

----- QUESTION 4
SELECT
u.user_name,
u.country,
vs.session_id,
vs.show_id,
vs.watch_minutes
FROM users u
INNER JOIN viewing_sessions vs
ON u.user_id = vs.user_id;

----QUESTION 5
SELECT
u.user_name,
u.country,
p.plan_name,
p.monthly_price,
s.start_date
FROM users u
INNER JOIN subscriptions s
ON u.user_id = s.user_id
INNER JOIN plans p
ON s.plan_id = p.plan_id;

----PART B LEFT JOIN
----QUESTION 6

SELECT
u.user_id,
u.user_name,
s.subscription_id,
s.start_date
FROM users u
LEFT JOIN subscriptions s
ON u.user_id = s.user_id;

----QUESTION 7
SELECT
p.plan_id,
p.plan_name,
s.subscription_id,
s.user_id
FROM plans p
LEFT JOIN subscriptions s
ON p.plan_id = s.plan_id;

----QUESTION 8
SELECT
sh.show_id,
sh.show_title,
vs.session_id,
vs.watch_minutes
FROM shows sh
LEFT JOIN viewing_sessions vs
ON sh.show_id = vs.show_id;

-----QUESTION 9
SELECT
vs.session_id,
vs.show_id,
vs.watch_minutes,
u.user_id,
u.user_name
FROM viewing_sessions vs
LEFT JOIN users u
ON vs.user_id = u.user_id;

----QUESTION 10
SELECT
u.user_name,
u.country,
p.plan_name,
p.monthly_price
FROM users u
LEFT JOIN subscriptions s
ON u.user_id = s.user_id
LEFT JOIN plans p
ON s.plan_id = p.plan_id;

----PART C FULL OUTER JOIN
----QUESTION 11
SELECT
u.user_id,
u.user_name,
s.subscription_id,
s.start_date
FROM users u
FULL OUTER JOIN subscriptions s
ON u.user_id = s.user_id;

----- QUESTION 12
SELECT
p.plan_id,
p.plan_name,
s.subscription_id,
s.user_id
FROM plans p
FULL OUTER JOIN subscriptions s
ON p.plan_id = s.plan_id;

----- QUESTION 13
SELECT
sh.show_id,
sh.show_title,
vs.session_id,
vs.watch_minutes
FROM shows sh
FULL OUTER JOIN viewing_sessions vs
ON sh.show_id = vs.show_id;

---- QUESTION 14
SELECT
u.user_id,
u.user_name,
vs.session_id,
vs.show_id,
vs.watch_minutes
FROM users u
FULL OUTER JOIN viewing_sessions vs
ON u.user_id = vs.user_id;

----QUESTION 15
SELECT
u.user_id,
u.user_name,
vs.session_id,
vs.show_id,
vs.watch_minutes
FROM users u
FULL OUTER JOIN viewing_sessions vs
ON u.user_id = vs.user_id;

------BONUS ANSNWERS
Users who have not subscribed to any plan:
User 4 (Kabelo)
User 5 (Lerato)
Subscriptions referencing non-existent users:
Subscription 504 → User
Shows never watched:
Show 704 (Cooking Lab)
Show 706 (Wild Earth)
Bonus 5
Plan 14 (Mobile)
