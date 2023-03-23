drop database condor;

create database condor;
use condor;

create table carrera(
	id varchar(10) primary key NOT NULL,
	nombre_carrera varchar(50) NOT NULL
);

create table estudiante(
	codigo varchar(10) primary key NOT NULL,
    cedula int NOT NULL,
    nombre varchar(50) NOT NULL,
    carrera varchar(10) NOT NULL,
    foreign key (carrera) references carrera(id) on delete cascade on update cascade
);

create table profesor(
	codigo varchar(10) primary key NOT NULL,
    cedula int NOT NULL,
    nombre varchar(50) NOT NULL
);

create table asignatura(
	codigo varchar(10) primary key NOT NULL,
    nombre varchar(50) NOT NULL
);

create table curso(
	codigo varchar(10) primary key NOT NULL,
    asignatura varchar(10) NOT NULL,
    profesor varchar(10) NOT NULL,
    estudiante varchar(10) NOT NULL,
    foreign key (asignatura) references asignatura (codigo) on update cascade on delete cascade,
    foreign key (estudiante) references estudiante (codigo) on update cascade on delete cascade,
    foreign key (profesor) references profesor(codigo) on update cascade on delete cascade
);

create table nota(
	estudiante varchar(10) NOT NULL,
    asignatura varchar(10) NOT NULL,
    semestre varchar(20) NOT NULL, 
    nota int NOT NULL,
    primary key (estudiante, asignatura),
    foreign key (asignatura) references asignatura (codigo) on update cascade on delete cascade,
    foreign key (estudiante) references estudiante (codigo) on update cascade on delete cascade
);

create table login_estudiante(
codigo varchar(10) primary key NOT NULL,
username varchar(50) NOT NULL,
password varchar(50) NOT NULL,
foreign key (codigo) references estudiante (codigo) on update cascade on delete cascade
);

create table login_profesor(
codigo varchar(10) primary key NOT NULL,
username varchar(50) NOT NULL,
password varchar(50) NOT NULL,
foreign key (codigo) references profesor (codigo) on update cascade on delete cascade
);


INSERT INTO carrera (id, nombre_carrera) VALUES
('100', 'Ingeniería Civil'),
('101', 'Ingeniería de Sistemas'),
('102', 'Ingeniería Eléctrica'),
('103', 'Ingeniería Mecánica'),
('104', 'Ingeniería Industrial'),
('105', 'Ingeniería Química');

INSERT INTO estudiante (codigo, cedula, nombre, carrera) VALUES
('001', 123456789, 'Quiles Arley', '100'),
('002', 234567891, 'Faihd Pineda', '101'),
('003', 345678912, 'Brayan Peña', '102'),
('004', 456789123, 'Juan Robayo', '103'),
('005', 567891234, 'David Casallas', '104'),
('006', 678912345, 'Sofia Osorio', '105');

INSERT INTO profesor (codigo, cedula, nombre) VALUES
('2001', 19876543, 'Roberto Gómez'),
('2002', 28765432, 'Luisa Ramírez'),
('2003', 37654321, 'Julio César Pérez'),
('2004', 46543210, 'María Elena Jiménez'),
('2005', 55432109, 'Juan Carlos Vargas'),
('2006', 64321098, 'Sofía Martínez');

INSERT INTO asignatura (codigo, nombre) VALUES
('MATH101', 'Matemáticas Básicas'),
('FIS101', 'Física General'),
('PROG101', 'Programación I'),
('PROG201', 'Programación II'),
('CIRCU101', 'Circuitos Eléctricos I'),
('CIRCU201', 'Circuitos Eléctricos II');

INSERT INTO curso (codigo, asignatura, profesor, estudiante) VALUES
('101', 'MATH101', '2001', '001'),
('102', 'FIS101', '2002', '002'),
('103', 'PROG101', '2003', '003'),
('104', 'PROG201', '2004', '004'),
('105', 'CIRCU101', '2005', '005'),
('106', 'CIRCU201', '2006', '006');

INSERT INTO nota (estudiante, asignatura, semestre, nota) VALUES
('001', 'MATH101', '2021-3', 30),
('002', 'FIS101', '2021-1', 40),
('003', 'PROG101', '2023-1', 50),
('004', 'PROG201', '2022-1', 45),
('005', 'CIRCU101', '2022-2', 20),
('006', 'CIRCU201', '2020-1', 15);

INSERT INTO login_estudiante (codigo, username, password) VALUES
('001', 'quilesarley', '1234'),
('002', 'faihdpineda', '1234'),
('003', 'brayanpena', '1234'),
('004', 'juanrobayo', '1234'),
('005', 'davidcasallas', '1234'),
('006', 'sofiaosorio', '1234');

INSERT INTO login_profesor (codigo, username, password) VALUES
('2001', 'robertogomez', '4321'),
('2002', 'luisaramirez', '4321'),
('2003', 'juliocesarperez', '4321'),
('2004', 'mariaelenajimenez', '4321'),
('2005', 'juancarlosvargas', '4321'),
('2006', 'sofiamartinez', '4321');

select * from nota;
SELECT * FROM login_estudiante;

SELECT asignatura.nombre AS materia, nota.nota AS nota, estudiante.nombre AS estudiante, estudiante.codigo AS codigo_estudiante, carrera.nombre_carrera AS carrera
FROM curso
INNER JOIN asignatura ON curso.asignatura = asignatura.codigo
INNER JOIN nota ON curso.estudiante = nota.estudiante AND curso.asignatura = nota.asignatura
INNER JOIN estudiante ON curso.estudiante = estudiante.codigo
INNER JOIN carrera ON estudiante.carrera = carrera.id
WHERE curso.estudiante = 004



