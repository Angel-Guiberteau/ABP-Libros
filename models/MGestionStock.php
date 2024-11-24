<?php
    class MGestionStock{
        private $conexion;

        function __construct(){
            require_once 'config/configdbH.php';

            $this->conexion = new mysqli(SERVIDOR, USUARIO, PASSWORD, BBDD); //Conecta con la base de datos
            $this->conexion->set_charset("utf8"); 
            //Desactivar errores
            $controlador = new mysqli_driver();
            $controlador->report_mode = MYSQLI_REPORT_OFF;
        }

        public function listarEntregados(){
             
            $sql= "SELECT 
                        reservas.nombreAlumno AS NombrePersona,
                        reservas.fecha_reserva AS FechaReserva,
                        libros.nombre AS NombreLibro,
                        clases.nombre AS NombreClase
                    FROM 
                        Reservas
                    INNER JOIN 
                        Reservas_Libros ON reservas.idReserva = Reservas_Libros.idReserva
                    INNER JOIN 
                        Libros ON Reservas_Libros.ISBN = libros.ISBN
                    INNER JOIN 
                        clases_asignaturas ON libros.idAsignatura = clases_asignaturas.idAsignatura
                    INNER JOIN 
                        Clases ON clases_asignaturas.idCurso = Clases.idCurso AND clases_asignaturas.letraClase = Clases.letraClase
                    WHERE 
                        Reservas_Libros.entregado = 1 AND reservas.apta = 1
                    ORDER BY 
                        reservas.fecha_reserva;";

            $resultado = $this->conexion->query($sql);

            while($fila = $resultado->fetch_assoc()){
                $arrayDatos[] = $fila;
            }

            if($arrayDatos){
                return $arrayDatos;
            }else{
                return null;
            }            
        }

        public function listarSobrantes(){
             
            $sql= "SELECT
                        libros.nombre AS nombre_libro,
                        COUNT(Reservas_Libros.ISBN) AS libros_sobrantes
                    FROM 
                        Reservas_Libros
                    INNER JOIN 
                        Reservas ON Reservas_Libros.idReserva = Reservas.idReserva
                    INNER JOIN 
                        Libros ON Reservas_Libros.ISBN = Libros.ISBN
                    WHERE 
                        Reservas.apta = 1  
                        AND Reservas_Libros.pedido = 1  
                        AND Reservas_Libros.entregado = 0  
                    GROUP BY 
                        Libros.ISBN, Libros.nombre;";

            $resultado = $this->conexion->query($sql);

            foreach($resultado as $fila){
                $arrayDatos[] = $fila;
            }

            if($arrayDatos){
                return $arrayDatos;
            }else{
                return null;
            }            
        }


        public function listarPendientes(){
             
            $sql= "SELECT 
                        Reservas_Libros.ISBN AS id_libro,
                        Libros.nombre AS nombre_libro,
                        COUNT(Reservas_Libros.ISBN) AS libros_pendientes
                    FROM 
                        Reservas_Libros
                    INNER JOIN 
                        Reservas ON Reservas_Libros.idReserva = Reservas.idReserva
                    INNER JOIN 
                        Libros ON Reservas_Libros.ISBN = Libros.ISBN
                    WHERE 
                        Reservas.apta = 1  
                        AND Reservas_Libros.pedido = 0
                        AND Reservas_Libros.entregado = 0 
                    GROUP BY 
                        Libros.ISBN, Libros.nombre;";


            $resultado = $this->conexion->query($sql);

            while($fila = $resultado->fetch_assoc()){
                $arrayDatos[] = $fila;
            }

            if($arrayDatos){
                return $arrayDatos;
            }else{
                return null;
            }            
        }

        public function listarPedidos(){
             
            $sql= "SELECT 
                        Libros.nombre AS nombre_libro,
                        COUNT(Reservas_Libros.ISBN) AS libros_pedidos
                    FROM 
                        Reservas_Libros
                    INNER JOIN 
                        Reservas ON Reservas_Libros.idReserva = Reservas.idReserva
                    INNER JOIN 
                        Libros ON Reservas_Libros.ISBN = Libros.ISBN
                    WHERE 
                        Reservas.apta = 1  
                        AND Reservas_Libros.pedido = 1  
                        AND Reservas_Libros.entregado = 0  
                    GROUP BY 
                        Libros.ISBN, Libros.nombre;";

            $resultado = $this->conexion->query($sql);

            while($fila = $resultado->fetch_assoc()){
                $arrayDatos[] = $fila;
            }

            if($arrayDatos){
                return $arrayDatos;
            }else{
                return null;
            }            
        }


    }

?>