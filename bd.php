<?php
class Database {
    private $host = "localhost";
    private $dbname = "skastr";
    private $username = "postgres";
    private $password = "jesussalva22*";

    public function connect() {
        try {
            $conn = new PDO("pgsql:host=$this->host;dbname=$this->dbname", $this->username, $this->password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;

            }   catch (PDOException $e) {
                echo "CONEXÃO FALHOU :( " . $e->getMessage();
            }
    }
}
?>