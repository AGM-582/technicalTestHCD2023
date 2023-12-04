<?php

$conexion = new mysqli('localhost', 'root', '', 'prueba_tecnica', '3306');
if ($conexion->connect_error) {
    die('Error de conexión: ' . $conexion->connect_error);
}

# Consulta Obligatoria Parte1
$consulta = $conexion->query("SELECT alumnos.dni, alumnos.apellido, alumnos.nombres, cursos.cod_curso, cursos.desccripcion, cursos.abreviatura
                              FROM alumnos
                              JOIN inscripciones ON alumnos.dni = inscripciones.dni_Alu 
                              JOIN cursos ON inscripciones.cod_curso = cursos.cod_curso;");

# Manejo de errores en la consulta
if (!$consulta) {
    die('Error en la consulta: ' . $conexion->error);
}

# Leer y armar
$arrayDatos = array();
while ($fila = $consulta->fetch_assoc()) {
    $abreviatura = $fila['abreviatura'];
    $cursoId = $fila['cod_curso'];
    $cursoNombre = $fila['desccripcion'];
    $alumno = array(
        'D.N.I.' => $fila['dni'],
        'Apellido Alumno' => $fila['apellido'],
        'Nombre/s Alumno' => $fila['nombres']
    );

    # curso y alumno
    $arrayDatos[$abreviatura][] = array(
        'Id. Curso' => $cursoId,
        'Nombre del Curso' => $cursoNombre,
        'Alumno/s Inscripto/s' => $alumno
    );
}

$conexion->close();

# Crear el endpoint y generar el JSON, unicode por las dudas
header('Content-Type: application/json', 'charset=utf-8');
echo json_encode(array(
    $arrayDatos
)/*, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES*/);