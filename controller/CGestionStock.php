<?php
    
    class CGestionStock{
        private $modelo;

        function __construct(){
            require_once 'models/MGestionStock.php';
            $this->modelo = new MGestionStock();
        }

        public function listarEntregados(){

            $resultado = $this->modelo->listarEntregados();
            
            return $resultado;
        }

        public function listarSobrantes() {
            $resultado = $this->modelo->listarSobrantes();

            return $resultado;
        }
        

        public function listarPendientes(){

            $resultado = $this->modelo->listarPendientes();
            
            return $resultado;
        }

        public function listarPedidos(){

            $resultado = $this->modelo->listarPedidos();
            
            return $resultado;
        }

    }



?>  