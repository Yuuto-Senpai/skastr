<?php
include_once 'bd.php';

Class Empresa {
    private $db

    public function __construct() {
        $this->db = (new Database())->connect();
    }

    public function addEmpresa($nome, $endereco, $email) {
        $stmt = $this->prepare("INSERT INTO tb_empresas (emp_nome, emp_ende, emp_email) VALUES (?,?,?)");
        $stmt->execute([$nome, $endereco, $email]);
    }


}
?>


