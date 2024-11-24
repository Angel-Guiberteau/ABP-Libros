<?php
    
    require_once "controller/CGestionStock.php";

    $stock = new CGestionStock();

    $entregados = $stock->listarEntregados();
    $sobrantes = $stock->listarSobrantes();
    $pendientes = $stock->listarPendientes();
    $pedidos = $stock->listarPedidos();

    if ($entregados && $sobrantes && $pendientes && $pedidos)
        require_once 'views/gestionStock.php';
    else
        require_once 'views/gestionStockError.php';

    
?>