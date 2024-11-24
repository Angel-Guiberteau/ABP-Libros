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
            <?php
                echo '<div class="correcto"><h1>Pedido Realizado Correctamente</h1></div>';
                header("refresh:3;url=./indexStock.php");
            ?>
            
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