-- EJERCICIOS PROCEDIMIENTOS ALMACENADOS

CREATE TABLE Dept (
    Dept_No INT NOT NULL,
    DNombre VARCHAR(50) NULL,
    Loc VARCHAR(50) NULL,
    CONSTRAINT PK_Dept PRIMARY KEY (Dept_No)
);

CREATE TABLE Emp (
    Emp_No INT NOT NULL,
    Apellido VARCHAR(50) NULL,
    Oficio VARCHAR(50) NULL,
    Dir INT NULL,
    Fecha_Alt TIMESTAMP NULL, -- Cambiado de SMALLDATETIME a TIMESTAMP
    Salario NUMERIC(9, 2) NULL,
    Comision NUMERIC(9, 2) NULL,
    Dept_No INT NULL, -- Coma añadida aquí
    CONSTRAINT PK_Emp PRIMARY KEY (Emp_No),
    CONSTRAINT FK_Emp_Dept FOREIGN KEY (Dept_No) REFERENCES Dept (Dept_No)
);


CREATE TABLE Hospital (
    Hospital_Cod INT NOT NULL,
    Nombre VARCHAR(50) NULL,
    Direccion VARCHAR(50) NULL,
    Telefono VARCHAR(50) NULL,
    Num_Cama INT NULL,
    CONSTRAINT PK_Hospital PRIMARY KEY (Hospital_Cod)
);

CREATE TABLE Doctor (
    Doctor_No INT NOT NULL,
    Hospital_Cod INT NOT NULL,
    Apellido VARCHAR(50) NULL,
    Especialidad VARCHAR(50) NULL, 
    CONSTRAINT PK_Doctor PRIMARY KEY (Doctor_No),
    CONSTRAINT FK_Doctor_Hospital FOREIGN KEY (Hospital_Cod) REFERENCES Hospital (Hospital_Cod)
);

CREATE TABLE Sala (
    Sala_Cod INT NOT NULL,
    Hospital_Cod INT NOT NULL,
    Nombre VARCHAR(50) NULL,
    Num_Cama INT NULL,
    CONSTRAINT PK_Sala PRIMARY KEY (Sala_Cod, Hospital_Cod),
    CONSTRAINT FK_Sala_Hospital FOREIGN KEY (Hospital_Cod) REFERENCES Hospital (Hospital_Cod)
);

CREATE TABLE Plantilla (
    Empleado_No INT NOT NULL,
    Sala_Cod INT NOT NULL,
    Hospital_Cod INT NOT NULL,
    Apellido VARCHAR(50) NULL,
    Funcion VARCHAR(50) NULL,
    T VARCHAR(15) NULL,
    Salario NUMERIC(9, 2) NULL, -- Coma añadida aquí
    CONSTRAINT PK_Plantilla PRIMARY KEY (Empleado_No),
    CONSTRAINT FK_Plantilla_Sala01 FOREIGN KEY (Sala_Cod, Hospital_Cod) REFERENCES Sala (Sala_Cod, Hospital_Cod)
);

CREATE TABLE Enfermo (
    Inscripcion INT NOT NULL,
    Apellido VARCHAR(50) NULL,
    Direccion VARCHAR(50) NULL,
    Fecha_Nac DATE NULL, -- Cambiado de VARCHAR(50) a DATE
    S VARCHAR(2) NULL,
    NSS INT NULL
    
    
);









-- Insertar datos en la tabla Dept
INSERT INTO Dept(Dept_No, DNombre, Loc) VALUES(10, 'CONTABILIDAD', 'ELCHE');
INSERT INTO Dept(Dept_No, DNombre, Loc) VALUES(20, 'INVESTIGACIÓN', 'MADRID');
INSERT INTO Dept(Dept_No, DNombre, Loc) VALUES(30, 'VENTAS', 'BARCELONA');
INSERT INTO Dept(Dept_No, DNombre, Loc) VALUES(40, 'PRODUCCIÓN', 'SALAMANCA');

-- Insertar datos en la tabla Emp
-- Nota: Las fechas se han cambiado al formato 'YYYY-MM-DD'
INSERT INTO Emp(Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7369, 'SANCHEZ', 'EMPLEADO', 7902, '1980-12-17', 10400, 0, 20),
(7499, 'ARROYO', 'VENDEDOR', 7698, '1981-02-22', 208000, 39000, 30),
(7521, 'SALA', 'VENDEDOR', 7689, '1981-02-22', 162500, 65000, 30), -- Asumí que 689 era un typo y quise decir 7689 (Dir de NEGRO). Ajusta si es otro valor. O podría ser NULL.
(7566, 'JIMENEZ', 'DIRECTOR', 7839, '1981-04-02', 386750, 0, 20),
(7654, 'MARTIN', 'VENDEDOR', 7698, '1981-09-28', 182000, 182000, 30),
(7698, 'NEGRO', 'DIRECTOR', 7839, '1981-05-01', 370500, 0, 30),
(7782, 'CEREZO', 'DIRECTOR', 7839, '1981-06-09', 318500, 0, 10),
(7788, 'NINO', 'ANALISTA', 7566, '1987-03-30', 390000, 0, 20),
(7839, 'REY', 'PRESIDENTE', NULL, '1981-11-17', 650000, 0, 10), -- Cambié Dir 0 a NULL, asumiendo que 0 significa "sin director". Si 0 es un Emp_No válido, mantenlo.
(7844, 'TOVAR', 'VENDEDOR', 7698, '1981-09-08', 195000, 0, 30),
(7876, 'ALONSO', 'EMPLEADO', 7788, '1987-05-03', 143000, 0, 20),
(7900, 'JIMENO', 'EMPLEADO', 7698, '1981-12-03', 123500, 0, 30),
(7902, 'FERNANDEZ', 'ANALISTA', 7566, '1981-12-03', 390000, 0, 20),
(7934, 'MUÑOZ', 'EMPLEADO', 7782, '1982-06-23', 169000, 0, 10),
(7119, 'SERRA', 'DIRECTOR', 7839, '1983-11-19', 225000, 39000, 20),
(7322, 'GARCIA', 'EMPLEADO', 7119, '1982-10-12', 129000, 0, 20);

-- Insertar datos en la tabla Hospital
INSERT INTO Hospital(Hospital_Cod, Nombre, Direccion, Telefono, Num_Cama) VALUES(19, 'Provincial', 'O Donell 50', '964-4256', 502);
INSERT INTO Hospital(Hospital_Cod, Nombre, Direccion, Telefono, Num_Cama) VALUES(18, 'General', 'Atocha s/n', '595-3111', 987);
INSERT INTO Hospital(Hospital_Cod, Nombre, Direccion, Telefono, Num_Cama) VALUES(22, 'La Paz', 'Castellana 1000', '923-5411', 412);
INSERT INTO Hospital(Hospital_Cod, Nombre, Direccion, Telefono, Num_Cama) VALUES(45, 'San Carlos', 'Ciudad Universitaria', '597-1500', 845);

-- Insertar datos en la tabla Doctor
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(22, 386, 'Cabeza D.', 'Psiquiatría');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(22, 398, 'Best D.', 'Urología');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(19, 435, 'López A.', 'Cardiología');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(22, 453, 'Galo D.', 'Pediatría');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(45, 522, 'Adams C.', 'Neurología');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(18, 585, 'Miller G.', 'Ginecología');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(45, 607, 'Chuki P.', 'Pediatría');
INSERT INTO Doctor(Hospital_Cod, Doctor_No, Apellido, Especialidad) VALUES(18, 982, 'Cajal R.', 'Cardiología');

-- Insertar datos en la tabla Sala
-- Es buena práctica especificar las columnas en el INSERT
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(1, 22, 'Recuperación', 10);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(1, 45, 'Recuperación', 15);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(2, 22, 'Maternidad', 34);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(2, 45, 'Maternidad', 24);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(3, 19, 'Cuidados Intensivos', 21);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(3, 18, 'Cuidados Intensivos', 10);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(4, 18, 'Cardiología', 53);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(4, 45, 'Cardiología', 55);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(6, 19, 'Psiquiátricos', 67);
INSERT INTO SALA (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES(6, 22, 'Psiquiátricos', 118);

-- Insertar datos en la tabla Plantilla
INSERT INTO Plantilla(Hospital_Cod, Sala_Cod, Empleado_No, Apellido, Funcion, T, Salario)
VALUES
(22, 6, 1009, 'Higueras D.', 'Enfermera', 'T', 200500),
(45, 4, 1280, 'Amigo R.', 'Interino', 'N', 221000),
(19, 6, 3106, 'Hernández', 'Enfermero', 'T', 275000),
(19, 6, 3754, 'Díaz B.', 'Enfermera', 'T', 226200),
(22, 1, 6065, 'Rivera G.', 'Enfermera', 'N', 162600),
(18, 4, 6357, 'Karplus W.', 'Interino', 'T', 337900),
(22, 1, 7379, 'Carlos R.', 'Enfermera', 'T', 211900),
(22, 6, 8422, 'Bocina G.', 'Enfermero', 'M', 183800),
(45, 1, 8526, 'Frank H.', 'Enfermera', 'T', 252200),
(22, 2, 9901, 'Núñez C.', 'Interino', 'M', 221000);

-- Insertar datos en la tabla Enfermo
-- Nota: Las fechas se han cambiado al formato 'YYYY-MM-DD'.
-- El año '56' se interpreta como '1956'. Ajustar si es necesario para el siglo XXI (ej. '2056').
INSERT INTO Enfermo(Inscripcion, Apellido, Direccion, Fecha_Nac, S, NSS)
VALUES
(10995, 'Laguía M.', 'Goya 20', '1956-05-16', 'M', 280862422),
(14024, 'Fernández M.', 'Recoletos 50', '1960-05-21', 'F', 284991452),
(18004, 'Serrano V.', 'Alcalá 12', '1967-06-23', 'F', 321790059),
(36658, 'Domin S.', 'Mayor 71', '1942-01-01', 'M', 160654471),
(38702, 'Neal R.', 'Orense 11', '1940-06-18', 'F', 380010217),
(39217, 'Cervantes M.', 'Perón 38', '1952-02-29', 'M', 440294390), -- 1952 fue año bisiesto
(59076, 'Miller B.', 'López de Hoyos 2', '1945-09-16', 'F', 311969044),
(63827, 'Ruiz P.', 'Ezquerdo 103', '1980-12-26', 'M', 100973253),
(64823, 'Fraiser A.', 'Soto 3', '1980-07-10', 'F', 285201776),
(74835, 'Benítez E.', 'Argentina', '1957-10-05', 'M', 154811767);


-- procedmientos almacenados 

-- Construya el procedimiento almacenado que saque todos los empleados que se dieron de
-- alta entre una determinada fecha inicial y fecha final y que pertenecen a un determinado
-- departamento.


CREATE OR REPLACE FUNCTION obtener_empleados_por_fecha_y_depto(
    p_fecha_inicio DATE,
    p_fecha_fin DATE,
    p_numero_departamento INT
)
RETURNS SETOF Emp -- Devuelve un conjunto de filas que coinciden con la estructura de la tabla Emp
LANGUAGE plpgsql
AS $$
BEGIN
    -- Comprobamos que la fecha de inicio no sea posterior a la fecha de fin
    IF p_fecha_inicio > p_fecha_fin THEN
        RAISE EXCEPTION 'La fecha de inicio no puede ser posterior a la fecha de fin.';
    END IF;

    RETURN QUERY
    SELECT
        * -- Selecciona todas las columnas de la tabla Emp
    FROM
        Emp e
    WHERE
        -- Convertimos Fecha_Alt a DATE para comparar solo la parte de la fecha
        CAST(e.Fecha_Alt AS DATE) BETWEEN p_fecha_inicio AND p_fecha_fin
        AND e.Dept_No = p_numero_departamento;
END;
$$;





SELECT * FROM obtener_empleados_por_fecha_y_depto('1981-01-01', '1981-12-31', 20);

SELECT * FROM obtener_empleados_por_fecha_y_depto('1981-01-01', '1981-12-31', 20);

SELECT * FROM obtener_empleados_por_fecha_y_depto('1981-02-01', '1981-09-30', 30);

select * from  obtener_empleados_por_fecha_y_depto('1981-02-01', '1981-09-30', 30);


select * from emp 






-- 2. 

CREATE OR REPLACE FUNCTION insertar_empleado(
    p_emp_no INT,
    p_apellido VARCHAR(50),
    p_oficio VARCHAR(50),
    p_dir INT, 
    p_fecha_alt TIMESTAMP, 
    p_salario NUMERIC(9,2),
    p_comision NUMERIC(9,2), 
    p_dept_no INT  
)
RETURNS INT 
LANGUAGE plpgsql
AS $$
DECLARE
    v_nuevo_emp_no INT;
BEGIN
    INSERT INTO Emp (
        Emp_No,
        Apellido,
        Oficio,
        Dir,
        Fecha_Alt,
        Salario,
        Comision,
        Dept_No
    ) VALUES (
        p_emp_no,
        p_apellido,
        p_oficio,
        p_dir,
        p_fecha_alt,
        p_salario,
        p_comision,
        p_dept_no
    ) RETURNING Emp_No INTO v_nuevo_emp_no; 


    RETURN v_nuevo_emp_no;


END;
$$;



SELECT insertar_empleado(
    8003,                     
    'FERNANDEZ',               
    'ASISTENTE',              
    NULL,                      
    '2025-05-20 10:30:00',    
    180000.00,                 
    NULL,                      
    30                        
) AS nuevo_empleado_id;




SELECT * FROM emp;



-- 3.

-- Construya el procedimiento que recupere el nombre, número y número de personas a
-- partir del número de departamento.



CREATE OR REPLACE FUNCTION obtener_info_departamento(
    p_numero_depto_entrada INT
)
RETURNS TABLE (
    numero_depto_salida INT,
    nombre_depto_salida VARCHAR(50),
    cantidad_personas BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        d.Dept_No,
        d.DNombre,
        COUNT(e.Emp_No) AS conteo_empleados 
    FROM
        Dept d
    LEFT JOIN
        Emp e ON d.Dept_No = e.Dept_No
    WHERE
        d.Dept_No = p_numero_depto_entrada
    GROUP BY
        d.Dept_No, d.DNombre;

   
END;
$$;



select * from obtener_info_departamento(10)





-- 4.

-- Diseñe y construya un procedimiento igual que el anterior, pero que recupere también las
-- personas que trabajan en dicho departamento, pasándole como parámetro el nombres


CREATE OR REPLACE FUNCTION obtener_info_departamento2(
    p_numero_depto_entrada INT
)
RETURNS TABLE (
    numero_depto_salida INT,
    nombre_depto_salida VARCHAR(50),
    cantidad_personas BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        d.Dept_No,
        d.DNombre,
        e.emp_no,
        COUNT(e.Emp_No) AS conteo_empleados 
    FROM
        Dept d
    LEFT JOIN
        Emp e ON d.Dept_No = e.Dept_No
    WHERE
        d.Dept_No = p_numero_depto_entrada
    GROUP BY
        d.Dept_No, d.DNombre;

   
END;
$$;


select * from obtener_info_departamento2(10)

select * from dept;


select * from emp e;


