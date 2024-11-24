<?php
    
class Mpedidos {
    private $conexion;

    function __construct() {
        require_once 'config/configdbH.php';

        $this->conexion = new mysqli(SERVIDOR, USUARIO, PASSWORD, BBDD); // Conexión a la base de datos
        $this->conexion->set_charset("utf8");

        // Desactivar errores
        $controlador = new mysqli_driver();
        $controlador->report_mode = MYSQLI_REPORT_OFF;
    }

    function realizarPedido($idLibro) {
    
        $sql = "UPDATE Reservas_Libros RL
                INNER JOIN Reservas R ON RL.idReserva = R.idReserva
                SET RL.pedido = 1
                WHERE RL.ISBN = '$idLibro'
                  AND R.apta = 1
                  AND RL.pedido = 0
                  AND RL.entregado = 0;";

        $this->conexion->query($sql);
       
        if ($this->conexion->affected_rows > 0) {
            return 0; 
        } else {
            return 1; 
        }
    }
}
?>
