<?php

require_once('bd.php');
$db= new Database();
$conn = $db->connect();
?>

<!DOCTYPE html>
<html>
    <head>
        <title>SKASTR - HOME</title>
    </head>
<body>
<h1>Empresas</h1>
    <?php
    $query = "SELECT * FROM tb_empresas";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $empresas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($empresas) > 0) {
        echo '<table border="1">';
        echo '<tr><th>ID</th><th>Nome</th><th>Endereço</th><th>Email</th></tr>';
        foreach ($empresas as $empresa) {
            echo '<tr>';
            echo '<td>' . $empresa['id_emp'] . '</td>';
            echo '<td>' . $empresa['emp_nome'] . '</td>';
            echo '<td>' . $empresa['emp_ende'] . '</td>';
            echo '<td>' . $empresa['emp_email'] . '</td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo 'Nenhuma empresa encontrada.';
    }
    ?>
</body>
</html>
        