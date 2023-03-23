drop database condor;

create database condor;
use condor;

create table major(
	id varchar(10) primary key NOT NULL,
	major_name varchar(50) NOT NULL
);

CREATE TABLE student (
  id varchar(10) PRIMARY KEY NOT NULL,
  code varchar(10) NOT NULL,
  name VARCHAR(50) NOT NULL,
  major VARCHAR(10) NOT NULL,
  FOREIGN KEY (major) REFERENCES major(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE professor (
  id varchar(10) PRIMARY KEY NOT NULL,
  code varchar(10) NOT NULL,
  name VARCHAR(50) NOT NULL
);

create table subject(
	subject_code varchar(10) primary key NOT NULL,
	name varchar(50) NOT NULL
);

CREATE TABLE course (
    course_code varchar(10) primary key NOT NULL,
    subject_code varchar(10) NOT NULL,
    professor_id varchar(10) NOT NULL,
    student_id varchar(10) NOT NULL,
    foreign key (subject_code) references subject (subject_code) on update cascade on delete cascade,
    foreign key (student_id) references student (id) on update cascade on delete cascade,
    foreign key (professor_id) references professor (id) on update cascade on delete cascade
);

create table grade(
	student_id varchar(10) NOT NULL,
	subject_code varchar(10) NOT NULL,
	semester varchar(20) NOT NULL,
	grade_value int NOT NULL,
	primary key (student_id, subject_code),
	foreign key (subject_code) references subject (subject_code) on update cascade on delete cascade,
	foreign key (student_id) references student (id) on update cascade on delete cascade
);

CREATE TABLE login (
  id_user varchar(10) PRIMARY KEY NOT NULL,
  username varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  role INT NOT NULL
);

INSERT INTO major (id, major_name) VALUES 
	('MAJ001', 'Systems Engineering'),
	('MAJ002', 'Civil Engineering'),
	('MAJ003', 'Electrical Engineering'),
	('MAJ004', 'Mechanical Engineering'),
	('MAJ005', 'Industrial Engineering'),
	('MAJ006', 'Chemical Engineering');
    
INSERT INTO student (id, code, name, major) VALUES
	('STD001', '001', 'Jhonattan Aponte', 'MAJ001'),
	('STD002', '002', 'Juan Robayo', 'MAJ001'),
	('STD003', '003', 'Miguel Arias', 'MAJ002'),
	('STD004', '004', 'Quiles Arley', 'MAJ002'),
	('STD005', '005', 'Faihd pineda', 'MAJ003'),
	('STD006', '006', 'Brayan pena', 'MAJ003'),
	('STD007', '007', 'David Casallas', 'MAJ004'),
	('STD008', '008', 'Sofia Sanchez', 'MAJ004'),
	('STD009', '009', 'Karen Garzon', 'MAJ005'),
	('STD010', '010', 'Juan Cardozo', 'MAJ005'),
	('STD011', '011', 'Danna Escobar', 'MAJ006'),
	('STD012', '012', 'Yolima Cruz', 'MAJ006');
    
INSERT INTO professor (id, code, name) VALUES
	('PROF001', 'P001', 'Edilmo Carvajal'),
	('PROF002', 'P002', 'Noe Arco'),
	('PROF003', 'P003', 'Hector Fuquene'),
    ('PROF004', 'P004', 'Luis Wanumen'),
	('PROF005', 'P005', 'Mireya Bernal'),
	('PROF006', 'P006', 'Jose serna');
    
INSERT INTO subject (subject_code, name) VALUES
	('SUB001', 'Algorithms Introduction'),
	('SUB002', 'Integral Calculation'),
	('SUB003', 'Databases'),
	('SUB004', 'Linear Algebra'),
	('SUB005', 'Differential Calculation'),
	('SUB006', 'Object Oriented Programming'),
	('SUB007', 'Data Structure'),
	('SUB008', 'Advanced Programming'),
	('SUB009', 'Advanced Databases'),
	('SUB010', 'Vectorial Calculation');
    
INSERT INTO course (course_code, subject_code, professor_id, student_id) VALUES
	('C001', 'SUB001', 'PROF001', 'STD001'),
	('C002', 'SUB002', 'PROF002', 'STD001'),
	('C003', 'SUB003', 'PROF003', 'STD001'),
	('C004', 'SUB004', 'PROF004', 'STD002'),
	('C005', 'SUB005', 'PROF005', 'STD002'),
	('C006', 'SUB006', 'PROF006', 'STD002'),
	('C007', 'SUB007', 'PROF001', 'STD003'),
	('C008', 'SUB008', 'PROF002', 'STD003'),
	('C009', 'SUB009', 'PROF003', 'STD003'),
	('C010', 'SUB010', 'PROF004', 'STD004'),
	('C011', 'SUB001', 'PROF005', 'STD004'),
	('C012', 'SUB002', 'PROF006', 'STD004');

INSERT INTO grade (student_id, subject_code, semester, grade_value) VALUES
	('STD001', 'SUB001', '2020-1', 45),
	('STD001', 'SUB002', '2020-1', 50),
	('STD001', 'SUB003', '2021-3', 35),
	('STD002', 'SUB004', '2022-3', 20),
	('STD002', 'SUB005', '2023-1', 35),
	('STD002', 'SUB006', '2019-3', 45),
    ('STD003', 'SUB007', '2022-1', 29),
	('STD003', 'SUB008', '2021-1', 35),
	('STD003', 'SUB009', '2021-1', 38),
	('STD004', 'SUB010', '2022-1', 30),
	('STD004', 'SUB001', '2023-1', 42),
	('STD004', 'SUB002', '2022-1', 44);

INSERT INTO login (id_user, username, password, role) VALUES
	('STD001', 'japonte', '1234', 1),
	('STD002', 'jrobayo', '1234', 1),
	('STD003', 'marias', '1234', 1),
    ('STD004', 'qarley', '1234', 1),
	('STD005', 'fpineda', '1234', 1),
	('STD006', 'bpena', '1234', 1),
    ('STD007', 'dcasallas', '1234', 1),
	('STD008', 'ssanchez', '1234', 1),
	('STD009', 'kgarzon', '1234', 1),
	('STD010', 'jcardozo', '1234', 1),
	('STD011', 'descobar', '1234', 1),
    ('STD012', 'ycruz', '1234', 1),
	('PROF001', 'ecarvajal', '1234', 2),
	('PROF002', 'narco', '1234', 2),
	('PROF003', 'hfuquene', '1234', 2),
    ('PROF004', 'lwanumen', '1234', 2),
	('PROF005', 'mbernal', '1234', 2),
	('PROF006', 'jserna', '1234', 2);

SELECT s.name AS 'name', s.code AS 'code', m.major_name AS 'major', sj.name AS 'subject', g.grade_value AS 'grade'
FROM student s 
JOIN major m ON s.major = m.id 
JOIN course c ON s.id = c.student_id 
JOIN subject sj ON c.subject_code = sj.subject_code 
JOIN grade g ON s.id = g.student_id AND sj.subject_code = g.subject_code 
WHERE s.id = 'STD001';

SELECT c.course_code, s.name AS subject_name, su.name AS student_name, g.grade_value AS student_grade, p.name AS professor_name, p.id AS professor_code
FROM course c
INNER JOIN subject s ON c.subject_code = s.subject_code
INNER JOIN student su ON c.student_id = su.id
INNER JOIN grade g ON su.id = g.student_id AND s.subject_code = g.subject_code
INNER JOIN professor p ON c.professor_id = p.id
WHERE c.professor_id = 'PROF001';



