<?php
    
    class Creservas{
        private $modelo;

        function __construct(){
            require_once 'models/MListarReservas.php';
            $this->modelo = new Mreservas();
        }

        public function listarReservas()
        {
            return $this->modelo->listarReservas();
        }

        public function listarLibrosPorReserva($idReservaActual)
        {
            return $this->modelo->listarLibrosPorReserva($idReservaActual);
        }
    }

?>