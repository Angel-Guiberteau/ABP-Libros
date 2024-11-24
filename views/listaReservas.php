<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Estilos -->
        <link rel="stylesheet" href="assets/css/imports/general.css">
        <link rel="stylesheet" href="assets/css/imports/headerFooter.css">
        <link rel="stylesheet" href="assets/css/individuales/listaReservas.css">
        <title>Reserva de Libros</title>
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
        <main class="contenido-principal">
            <section class="seccion-reservas">
                <h1>Total de reservas</h1>
                <div class="acciones">
                    <a class="btn-anadir">+</a>    
                    <a class="btn-filtrar">Filtrar</a>
                    <a class="btn-ordenar">Ordenar</a>
                    <a class="btn-pedido" href="./indexStock.php">Realizar pedido</a>
                </div>
                <table class="tabla-reservas">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Correo</th>
                            <th>Curso</th>
                            <th>Clase</th>
                            <th>Libros</th>
                            <th>Doc</th>
                            <th>Fecha reserva</th>
                            <th>Apto</th>
                            <th>Notificar</th>
                            <th>Gestionar</th>
                            <th>Pedido</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                        foreach ($datos as $fila) {
                            echo '<tr>';
                            echo '<td>' . $fila['nombreAlumno'] . '</td>';
                            echo '<td>' . $fila['correo'] . '</td>';
                            echo '<td>' . $fila['nombreCurso'] . '</td>';
                            echo '<td>' . $fila['letraClase'] . '</td>';
                            echo '<td>';
                            echo '<select>';
                            echo '<option selected disabled hidden>Libros</option>';
                        
                            // Listar los libros (sin verificar 'pedido' aquí, ya que está en el nivel de la reserva)
                            foreach ($fila['libros'] as $libro) {
                                echo '<option>' . $libro['nombreLibro'] . '</option>';
                            }
                        
                            echo '</select>';
                            echo '</td>';
                            echo '<td><button class="btn-doc">Ver</button></td>';
                            echo '<td>' . $fila['fecha_reserva'] . '</td>';
                        
                            // Checkbox de 'Apto'
                            if ($fila['apto'] == 1) {
                                echo '<td><input type="checkbox" checked></td>';
                            } else {
                                echo '<td><input type="checkbox" disabled></td>';
                            }
                        
                            echo '<td><button class="btn-notificar">Notificar</button></td>';
                            echo '<td><button class="btn-gestionar">Gestionar</button></td>';
                        
                            // ------------------------------------------------
                            
                            $todosPedidos = true; 
                            foreach ($fila['libros'] as $libro) {
                                if ($libro['pedido'] == 0) { 
                                    $todosPedidos = false; 
                                    break; 
                                }
                            }

                            if ($todosPedidos) {
                                echo '<td><input type="checkbox" checked></td>'; 
                            } else {
                                echo '<td><input type="checkbox" disabled></td>';
                            }
                        
                            echo '</tr>';
                        } 
                        ?>
                    </tbody>
                </table>  
                <?php
                    
                ?>
            </section>
        </main>
        <footer>
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
        </footer>
    </body>
</html>