<?php
    class Mreservas{

        private $conexion;

        function __construct(){
            require_once 'config/configdbH.php';

            $this->conexion = new mysqli(SERVIDOR, USUARIO, PASSWORD, BBDD); //Conecta con la base de datos
            $this->conexion->set_charset("utf8"); 
            //Desactivar errores
            $controlador = new mysqli_driver();
            $controlador->report_mode = MYSQLI_REPORT_OFF;
        }

        public function listarReservas(){
             
            $sql = 'SELECT
                        Reservas.nombreAlumno, 
                        Reservas.correo, 
                        Reservas.fecha_reserva, 
                        Reservas.idCurso, 
                        Reservas.letraClase, 
                        Reservas.apta as apto,
                        Reservas.idReserva, 
                        Cursos.nombre AS nombreCurso
                    FROM Reservas
                    INNER JOIN 
                        Reservas_Libros ON Reservas.idReserva = Reservas_Libros.idReserva
                    INNER JOIN 
                        Libros ON Reservas_Libros.ISBN = Libros.ISBN
                    INNER JOIN
                        Cursos ON Reservas.idCurso = Cursos.idCurso
                    GROUP BY 
                        Reservas.idReserva
                    ORDER BY 
                        Reservas.nombreAlumno ASC;';

            $resultado = $this->conexion->query($sql);

            while($fila = $resultado->fetch_assoc()){
                $arrayLibros = array();
                $idReservaActual = $fila['idReserva'];
                $arrayLibros = $this->listarLibrosPorReserva($idReservaActual);
                $fila['libros'] = $arrayLibros;
                $arrayDatos[] = $fila;
            }

            return $arrayDatos;
        }   

        public function listarLibrosPorReserva($idReserva){
            $sql = 'SELECT 
                Libros.nombre AS nombreLibro,
                Reservas_Libros.pedido AS pedido
            FROM Reservas_Libros
            INNER JOIN 
                Libros ON Reservas_Libros.ISBN = Libros.ISBN
            WHERE 
                Reservas_Libros.idReserva = ' . $idReserva . ';';

            $resultado = $this->conexion->query($sql);

            while($fila = $resultado->fetch_assoc()){
                $arrayDatos[] = $fila;
            }

            return $arrayDatos;
        }
    }
?>