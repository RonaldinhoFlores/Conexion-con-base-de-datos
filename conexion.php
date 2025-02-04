<?php
// Configuración de la conexión
$servername = "localhost";  // Dirección del servidor MySQL
$username = "root";         // Nombre de usuario de MySQL (por defecto en XAMPP es 'root')
$password = "";             // Contraseña de MySQL (por defecto en XAMPP está vacío)
$dbname = "dbConexionDB";   // Nombre de la base de datos que creaste

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consulta para obtener los datos de la tabla INVESTIGADOR
$sql = "SELECT nombre, centro, correo_elec, tema FROM INVESTIGADOR";
$result = $conn->query($sql);

// Verificar si hay resultados
if ($result->num_rows > 0) {
    // Mostrar los datos de cada fila
    echo "<table border='1'>
            <tr>
                <th>Nombre</th>
                <th>Centro</th>
                <th>Correo Electrónico</th>
                <th>Tema</th>
            </tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["nombre"] . "</td>
                <td>" . $row["centro"] . "</td>
                <td>" . $row["correo_elec"] . "</td>
                <td>" . $row["tema"] . "</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "0 resultados";
}

// Cerrar la conexión
$conn->close();
?>