# technicalTestHCD2023
HCD Full-Stack Technical Test taken from 12/01/2023 to 12/04/2023

Optional Query for Step 1: SELECT
     alumnos.dni,
     alumnos.apellido,
     alumnos.nombres,
     cursos.desccripcion AS descripcion,
     pagos.monto AS pagado
 FROM
     alumnos
 JOIN
     inscripciones ON inscripciones.dni_Alu = alumnos.dni
 JOIN
     cursos ON cursos.cod_curso = inscripciones.cod_curso
 LEFT JOIN
     pagos ON pagos.dni_alu = alumnos.dni AND pagos.cod_curso = cursos.cod_curso AND pagos.mes = 6 AND pagos.anio = 2023
WHERE
     (cursos.desccripcion = 'Desarrollo Back End' AND (pagos.monto IS NULL OR pagos.monto = 0))
     OR (cursos.desccripcion = 'Desarrollo Back End' AND pagos.dni_alu IS NULL);
