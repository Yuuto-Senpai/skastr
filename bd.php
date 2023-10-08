<?php

class Database {
    private $host;
    private $dbname;
    private $username;
    private $password;

    public function __construct($host = "localhost", $dbname = "skastr", $username = "postgres", $password = "jesussalva22*") {
        $this->host = $host;
        $this->dbname = $dbname;
        $this->username = $username;
        $this->password = $password;
    }

    public function connect() {
        $connection = null;
        
        try {
            $connection = new PDO("pgsql:host=$this->host;dbname=$this->dbname", $this->username, $this->password);
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            echo "Handshake bem-sucedido :)";
            
        } catch (PDOException $e) {
            error_log($e->getMessage());
            echo "Falha no Handshake :(" . $e->getMessage();
        }

        return $connection;
    }
}

// Exemplo de como usar
$db = new Database();
$conn = $db->connect();

if ($conn) {
    echo "Conexão realizada com sucesso.";
} else {
    echo "Falha na conexão.";
}

?>