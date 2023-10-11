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
            $connection = new PDO("pgsql:host={$this->host};dbname={$this->dbname}", $this->username, $this->password);
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Se necessário, você pode definir o conjunto de caracteres aqui
            // $connection->exec("SET NAMES 'utf8'");

        } catch (PDOException $e) {
            // Gravando a mensagem de erro no log de erros do PHP
            error_log($e->getMessage());

            // Exibindo uma mensagem mais genérica na tela
            echo "Falha no Handshake :(";
        }

        return $connection;
    }
}

// Exemplo de como usar
$db = new Database();
$conn = $db->connect();

if ($conn) {
    echo "Handshake bem-sucedido :)";
} else {
    echo "Falha na conexão.";
}

?>