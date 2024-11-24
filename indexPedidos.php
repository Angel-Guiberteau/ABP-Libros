<?php
require_once 'controller/Cpedidos.php';

    $pedidos = new Cpedidos();

    $idLibro = $_GET['id'] ?? null;

    if ($idLibro) {
        
        if ($pedidos->realizarPedido($idLibro) == 0) 
            require_once 'views/pedidos.php'; 
        else 
            require_once 'views/pedidosError.php'; 
    

    } else {
        require_once 'views/pedidosError.php';
    }
?>
