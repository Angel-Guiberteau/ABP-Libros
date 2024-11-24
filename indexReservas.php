<?php
    
    require_once 'controller/CListarReservas.php';

    $reservas = new Creservas();

    $datos = $reservas->listarReservas();


    if($datos)
        require_once 'views/listaReservas.php';
    else
        require_once 'views/listaReservasError.php';

?>