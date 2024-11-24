<?php
    
    class Cpedidos {
        private $modelo;

        function __construct() {
            require_once 'models/Mpedidos.php';
            $this->modelo = new Mpedidos(); 
        }

        function realizarPedido($idLibro) {

            return $this->modelo->realizarPedido($idLibro);
            
        }
    }
    
?>
