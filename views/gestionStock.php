<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Estilos -->
        <link rel="stylesheet" href="assets/css/imports/general.css">
        <link rel="stylesheet" href="assets/css/imports/headerFooter.css">
        <link rel="stylesheet" href="assets/css/individuales/gestionStock.css">
        <title>Formulario de Reserva</title>  
    </head>
    <body>
    <header>
            <div class="logo">
                <a href="">
                    <img src="assets/resources/logo.png" alt="Logo">
                </a>
            </div>
            <nav>
                <a href="indexStock.php">Gestión Stock</a>
                <a href="indexReservas.php">Gestión Reservas</a>
                <a href="">Gestión Libros</a>
            </nav>
            <div class="icono-usuario">
                <a href="indexReservas.php">
                    <img src="assets/resources/login.png" alt="login">
                </a>
            </div>
        </header>
        <main>
            <h1>Gestión de Stock</h1>
            <div id="entregados">
                <h2>Libros Entregados</h2>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Libro</th>
                        <th>Clase</th>
                    </tr>
                    <?php
                        foreach ($entregados as $fila) {
                            echo "<tr>";
                            echo "<td>" . $fila['NombrePersona'] . "</td>";
                            echo "<td>" . $fila['FechaReserva'] . "</td>";
                            echo "<td>" . $fila['NombreLibro'] . "</td>";
                            echo "<td>" . $fila['NombreClase'] . "</td>";
                            echo "</tr>";
                        }
                    ?>
                </table>
            </div>

            <div id="sobrantes">
                <h2>Libros Sobrantes</h2>
                <table>
                    <tr>
                        <th>Cantidad</th>
                        <th>Libro</th>
                    </tr>
                    <?php
                        foreach ($sobrantes as $fila) {
                            echo "<tr>";
                            echo "<td>" . $fila['nombre_libro'] . "</td>";
                            echo "<td>" . $fila['libros_sobrantes'] . "</td>";
                            echo "</tr>";
                        }
                    ?>
                </table>
            </div>

            <div id="pendientes">
                <h2>Libros Pendientes</h2>
                <table>
                    <tr>
                        <th>Cantidad</th>
                        <th>Libro</th>
                        <th>Pedido</th>
                    </tr>
                    <?php
                        foreach ($pendientes as $fila) {
                            echo "<tr>";
                            echo "<td>" . $fila['libros_pendientes'] . "</td>";
                            echo "<td>" . $fila['nombre_libro'] . "</td>";
                            echo '<td><a href="./indexPedidos.php?id=' . $fila['id_libro'] . '" class="pedido">Pedir</a></td>';
                            echo "</tr>";
                        }
                    ?>
                </table>
            </div>
            <div id="pedidos">
                <h2>Libros Pedidos</h2>
                <table>
                    <tr>
                        <th>Cantidad</th>
                        <th>Libro</th>
                    </tr>
                    <?php
                        foreach ($pedidos as $fila) {
                            echo "<tr>";
                            echo "<td>" . $fila['libros_pedidos'] . "</td>";
                            echo "<td>" . $fila['nombre_libro'] . "</td>";
                            echo "</tr>";
                        }
                    ?>
                </table>
            </div>
        </main>
        <!-- <footer>
            <div class="colaboradores">
                <b>Colaboradores</b>
                <p><a href="https://atabalfundacion.wordpress.com/">Fundacion Atabal</a></p>
                <p><a href="https://www.aytobadajoz.es/es/ayto/portada">Ayto. Badajoz</a></p>
                <p><a href="https://www.aexpainba-fmm.org/comienzo.asp">AEXPAINBA</a></p>
                <p><a href="http://www.fidesbancaetica.com/">FIDES</a></p>
            </div>
            <div class="cita">
                <p>"El examen de conciencia es siempre el mejor medio para cuidar bien el alma."</p>
                <p>"San Ignacio de Loyola"</p>
            </div>
            <div class="contacto">
                <b id="contactar">Contactar</b>
                <p><i class="fas fa-map-marker-alt"></i> C/ Corte de Peleas, 79 06009 Badajoz</p>
                <p><i class="fas fa-phone"></i> +34 924 25 17 61</p>
            </div>
        </footer> -->
    </body>
</html>