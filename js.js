document.addEventListener("DOMContentLoaded", () => {
  // Hacer la solicitud al endpoint de parte1
  fetch("./endpoint.php")
    .then((endpointResponse) => endpointResponse.json())
    .then((endpointResponse) => {
      if (endpointResponse && typeof endpointResponse === "object") {
        // Crear la tabla
        createTable(endpointResponse);
      } else {
        console.error(
          "Error: Respuesta del servidor en un formato inesperado."
        );
      }
    })
    .catch((error) => console.error("Error:", error));

  function createTable(endpointResponse) {
    const zonaTabla = document.getElementById("zona-tabla");
    // Iterar sobre las abreviaturas
    for (const abreviaturaCurso in endpointResponse[0]) {
      if (endpointResponse[0].hasOwnProperty(abreviaturaCurso)) {
        const curso = endpointResponse[0][abreviaturaCurso];

        // Crear un título para cada curso agregar id para el formato en css
        const tituloCurso = document.createElement("h2");
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
