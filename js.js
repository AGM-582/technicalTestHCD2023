document.addEventListener("DOMContentLoaded", () => {
  // Hacer la solicitud al endpoint parte1
  fetch("./endpoint.php")
    .then((respuesta) => respuesta.json())
    .then((respuesta) => {
      if (respuesta && typeof respuesta === "object") {
        // Crear la tabla
        createTable(respuesta);
      } else {
        console.error(
          "Error: Respuesta del servidor en un formato inesperado."
        );
      }
    })
    .catch((error) => console.error("Error:", error));

  const zonaTabla = document.getElementById("zona-tabla");

  function createTable(respuestaEndpoint) {
    console.log("ENTRANDO EN LA FUNCIÓN:", respuestaEndpoint);
    // Iterar sobre las abreviaturas
    for (const abreviaturaCurso in respuestaEndpoint[0]) {
      console.log("BUCLE FOR:", respuestaEndpoint[0]);
      if (respuestaEndpoint[0].hasOwnProperty(abreviaturaCurso)) {
        const curso = respuestaEndpoint[0][abreviaturaCurso];
        console.log("MUESTRO CURSOS: ", curso);
        // Crear un título para cada curso
        const tituloCurso = document.createElement("h2");
        //agregao id para el formato en css
        tituloCurso.id = "subTitulos";
        tituloCurso.textContent = `Curso: ${abreviaturaCurso}`;
        zonaTabla.appendChild(tituloCurso);

        // Crear las partes de la tabla
        let tabla = document.createElement("table");
        let encabezado = document.createElement("thead");
        let cuerpo = document.createElement("tbody");

        // encabezado
        let filaEncabezado = document.createElement("tr");
        let titulos = [
          "Id. Curso",
          "Nombre del Curso",
          "D.N.I.",
          "Apellido Alumno",
          "Nombre/s Alumno",
        ];
        titulos.forEach((titulo) => {
          let celda = document.createElement("th");
          celda.textContent = titulo;
          filaEncabezado.appendChild(celda);
        });
        encabezado.appendChild(filaEncabezado);

        // foreach de cursos
        curso.forEach((alumno) => {
          let fila = document.createElement("tr");

          // datos dealumnos
          let apellidoAlumno =
            alumno["Alumno/s Inscripto/s"]["Apellido Alumno"];
          let dniAlumno = alumno["Alumno/s Inscripto/s"]["D.N.I."];
          let nombresAlumno = alumno["Alumno/s Inscripto/s"]["Nombre/s Alumno"];
          let idCurso = alumno["Id. Curso"];
          let nombreCurso = alumno["Nombre del Curso"];

          // Se crearían tds
          let celdas = [
            idCurso,
            nombreCurso,
            dniAlumno,
            apellidoAlumno,
            nombresAlumno,
          ];
          celdas.forEach((celda) => {
            let celdaFila = document.createElement("td");
            celdaFila.textContent = celda;
            fila.appendChild(celdaFila);
          });

          cuerpo.appendChild(fila);
        });

        tabla.appendChild(encabezado);
        tabla.appendChild(cuerpo);

        //AGREGAMOS LA TABLA
        zonaTabla.appendChild(tabla);
      }
    }
  }
});
