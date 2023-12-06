# MODELO RELACIONAL

<image src="./relacional.png" alt="modelo relacional inicial">

# MODELO ENTIDAD RELACION

<image src="./entidad_relacion.png" alt="modelo entidad relacion incial">

# MODIFICACIONES
**Desde el inciso 1 hasta el inciso 3**

1. Agregue un campo Estado_Matrícula a la tabla Matrícula que indique si el estudiante se encuentra “En Ejecución”, “Terminado” o “Cancelado” .

    Teniendo en cuenta el primer modelo relacional se nota que tuvimos que crear la tabla ***Matricula***. Y introducirla en nuestra base de datos.

    ```sql
    // Como primero eliminamos la relación que hay entre la tabla RUTA y la tabla APRENDIZ
    ALTER TABLE Aprendiz DROP fk_aprendiz_id_ruta;
    
    // Ahora creamos la tabla que necesitamos con sus respectivas relaciones
    CREATE TABLE IF NOT EXISTS Matricula (
        id_aprendiz INT NOT NULL,
        id_ruta INT NOT NULL,
        state ENUM('Activo', 'Terminado', 'Cancelado'),
        FOREIGN KEY (id_ruta) REFERENCES ROUTE(id),
        FOREIGN KEY (id_aprendiz) REFERENCES APRENDIZ(id)
    );
    ```

2. Agregue el campo edad a la tabla de Aprendices.

    ```sql
    // Agregamos la columna age a la tabla APRENDIZ
    ALTER TABLE Aprendiz ADD COLUMN age INT NOT NULL;
    ```

3. Si suponemos que los cursos tienen una duración diferente dependiendo de la ruta que lo contenga ¿qué modificación haría a la estructura de datos ya planteada?

    ```sql
    // Agregamos la columna duration a la tabla RUTA_CURSO
    ALTER TABLE RUTA_CURSO ADD COLUMN duration INT NOT NULL;
    ```

# CONSULTAS
**Desde el inciso 4 hasta el inciso 10**

4. Seleccionar los nombres y edades de aprendices que están cursando la carrera de electrónica.

    ```sql
    SELECT
        CONCAT(first_name,' ',last_name) as Nombre,
        age AS Edad
    FROM Aprendiz
    INNER JOIN sena.Matricula R on Aprendiz.id = R.id_aprendiz
    INNER JOIN sena.Ruta R2 on R.id_ruta = R2.id
    LEFT JOIN sena.Carrera C on R2.id_carrera = C.id
    WHERE C.name = "Electrónica" AND R.state="Activo";
    ```

5. Seleccionar Nombres de Aprendices junto al nombre de la ruta de aprendizaje que cancelaron.

    ```sql
    SELECT
        CONCAT(first_name,' ',last_name) as Nombre,
        C.name as Carrera
    FROM Trainee
    INNER JOIN sena.Matricula R on Aprendiz.id = R.id_aprendiz
    INNER JOIN sena.Ruta R2 on R.id_ruta = R2.id
    LEFT JOIN sena.Carrera C on R2.id_carrera = C.id
    WHERE R.state="Cancelado";
    ```
    <image src="img/5.png" alt="modelo relacional inicial">

6. Seleccionar Nombre de los cursos que no tienen un instructor asignado.

    ```sql
    SELECT
        name as Curso
    FROM Curso
    LEFT JOIN sena.CursoMaestro CT ON Curso.id = CT.id_curso
    WHERE CT.id_maestro IS NULL;
    ```
    <image src="img/6.png" alt="modelo relacional inicial">

7. Seleccionar Nombres de los instructores que dictan cursos en la ruta de aprendizaje “Sistemas de Información Empresariales”.

    ```sql
    SELECT DISTINCT 
        T.name as Instructor
    FROM Maestro T
    INNER JOIN sena.CursoMaestro CT on T.id = CT.id_maestro
    INNER JOIN sena.CursoRuta CR on CT.id_curso = CR.id_curso
    INNER JOIN sena.Ruta R on CR.id_ruta = R.id
    WHERE R.name = "Sistemas de Información Empresariales";

    ```
    <image src="img/7.png" alt="modelo relacional inicial">

8. Genere un listado de todos los aprendices que terminaron una Carrera mostrando el nombre del profesional, el nombre de la carrera y el énfasis de la carrera (Nombre de la Ruta de aprendizaje)

    ```sql
    SELECT
        CONCAT(first_name, ' ', last_name) as Profesional,
        C.name as Carrera,
        R.name as Enfasis
    FROM Trainee T
    INNER JOIN sena.Matricula Re on T.id = Re.id_trainee
    INNER JOIN sena.Ruta R on Re.id_ruta = R.id
    INNER JOIN sena.Carrera C on R.id_carrera = C.id
    WHERE Re.state = "Terminado";
    ```
    <image src="img/8.png" alt="modelo relacional inicial">

9. Genere un listado de los aprendices matriculados en el curso “Bases de Datos Relacionales”.

    ```sql
    SELECT
        CONCAT(first_name, '', last_name) AS Nombre
    FROM Trainee
    INNER JOIN sena.GrupoAprendiz GT on Aprendiz.id = GT.id_aprendiz
    INNER JOIN sena.CursoMaestro CT on GT.id_grupo = CT.id
    INNER JOIN sena.Curso C on CT.id_curso = C.id
    WHERE C.name = "Bases de Datos Relacionales";
    ```
    <image src="img/9.png" alt="modelo relacional inicial">

10. Nombres de Instructores que no tienen curso asignado.

    ```sql
    SELECT
        T.name as Instructor
    FROM Maestro T
    LEFT JOIN sena.CursoMaestro CT on T.id = CT.id_maestro
    WHERE CT.id_curso IS NULL;
    ```
    <image src="img/10.png" alt="modelo relacional inicial">
    

# PREGUNTAS
**Preguntas sobre SQL con opción múltiple:**

1. ¿Cuál es la función de SQL?

a) Manejar datos en bases de datos

b) Crear páginas web interactivas

c) Diseñar interfaces de usuario

Respuesta: a) Manejar datos en bases de datos

2. ¿Qué significa "SQL"?

a) Structured Query Language

b) Simple Query Language

c) System Query Language

Respuesta: a) Structured Query Language

3. ¿Cuál es la cláusula utilizada para filtrar registros en SQL?

a. WHERE

b) SELECT

c) FROM

Respuesta: a) WHERE

4. ¿Qué comando se utiliza para eliminar una tabla en SQL?

a) DELETE TABLE

b) REMOVE TABLE

c) DROP TABLE

Respuesta: c) DROP TABLE








