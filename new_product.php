<?php
// Initialize variables with empty values
$nome = $descricao = $preco = $stock = $desconto = '';
$nome_err = $preco_err = $stock_err = $desconto_err = '';

// Process form data when the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Validate name
    if (empty(trim($_POST['nome']))) {
        $nome_err = 'Por favor, insira o nome do produto.';
    } else {
        $nome = trim($_POST['nome']);
    }

    // Validate price
    if (empty(trim($_POST['preco']))) {
        $preco_err = 'Por favor, insira o preço do produto.';
    } else {
        $preco = trim($_POST['preco']);
    }

    // Validate stock
    if (empty(trim($_POST['stock']))) {
        $stock_err = 'Por favor, insira o estoque do produto.';
    } else {
        $stock = trim($_POST['stock']);
    }

    // Validate discount
    if (empty(trim($_POST['desconto']))) {
        $desconto_err = 'Por favor, insira o desconto do produto.';
    } else {
        $desconto = trim($_POST['desconto']);
    }

    // Check input errors before inserting in database
    if (empty($nome_err) && empty($preco_err) && empty($stock_err) && empty($desconto_err)) {
        // Prepare an insert statement
        $sql = 'INSERT INTO tb_produtos (id_empr, id_categoria, id_subcategoria, prod_nome, prod_descricao, prod_preco, prod_stock, prod_desconto) VALUES (:id_empr, :id_categoria, :id_subcategoria, :prod_nome, :prod_descricao, :prod_preco, :prod_stock, :prod_desconto)';

        if ($stmt = $pdo->prepare($sql)) {
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(':id_empr', $param_id_empr, PDO::PARAM_INT);
            $stmt->bindParam(':id_categoria', $param_id_categoria, PDO::PARAM_INT);
            $stmt->bindParam(':id_subcategoria', $param_id_subcategoria, PDO::PARAM_INT);
            $stmt->bindParam(':prod_nome', $param_nome, PDO::PARAM_STR);
            $stmt->bindParam(':prod_descricao', $param_descricao, PDO::PARAM_STR);
            $stmt->bindParam(':prod_preco', $param_preco, PDO::PARAM_STR);
            $stmt->bindParam(':prod_stock', $param_stock, PDO::PARAM_INT);
            $stmt->bindParam(':prod_desconto', $param_desconto, PDO::PARAM_STR);

            // Set parameters
            $param_id_empr = 1; // Replace with the actual ID of the company
            $param_id_categoria = 1; // Replace with the actual ID of the category
            $param_id_subcategoria = 1; // Replace with the actual ID of the subcategory
            $param_nome = $nome;
            $param_descricao = $descricao;
            $param_preco = $preco;
            $param_stock = $stock;
            $param_desconto = $desconto;

            // Attempt to execute the prepared statement
            if ($stmt->execute()) {
                // Redirect to products page
                header('location: products.php');
                exit();
            } else {
                echo 'Algo deu errado. Por favor, tente novamente mais tarde.';
            }

            // Close statement
            unset($stmt);
        }
    }

    // Close connection
    unset($pdo);
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Novo Produto</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
        <ul>
                <li><a href="index.php">Início</a></li>
                <li><a href="https://skaenosystem.com/skastr01">Produtos</a></li>
                <li><a href="servico.php">Serviços</a></li>
                <li><a href="sobrenos.php">Sobre Nós</a></li>
                <li><a href="contato.php">Contato</a></li>
                <li><a href="new_product.php">REMOVER DEPOIS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section class="new-product">
            <h2>Novo Produto</h2>
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
                <div class="form-group">
                    <label for="nome">Nome do Produto:</label>
                    <input type="text" id="nome" name="nome" value="<?php echo $nome; ?>">
                    <span class="error"><?php echo $nome_err; ?></span>
                </div>
                <div class="form-group">
                    <label for="descricao">Descrição do Produto:</label>
                    <textarea id="descricao" name="descricao"><?php echo $descricao; ?></textarea>
                </div>
                <div class="form-group">
                    <label for="preco">Preço do Produto:</label>
                    <input type="text" id="preco" name="preco" value="<?php echo $preco; ?>">
                    <span class="error"><?php echo $preco_err; ?></span>
                </div>
                <div class="form-group">
                    <label for="stock">Estoque do Produto:</label>
                    <input type="text" id="stock" name="stock" value="<?php echo $stock; ?>">
                    <span class="error"><?php echo $stock_err; ?></span>
                </div>
                <div class="form-group">
                    <label for="desconto">Desconto do Produto:</label>
                    <input type="text" id="desconto" name="desconto" value="<?php echo $desconto; ?>">
                    <span class="error"><?php echo $desconto_err; ?></span>
                </div>
                <div class="form-group">
                    <button type="submit">Salvar</button>
                    <button type="reset">Limpar</button>
                </div>
            </form>
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Skaeno System. Todos os direitos reservados.</p>
    </footer>
</body>
</html>