<?php
// Include the database connection details
require_once 'bd.php';

// Query the database for all products
$sql = "SELECT * FROM tb_produtos";
$result = $conn->query($sql);

// Check if the query was successful
if ($result) {
    // Fetch the results as an associative array
    $products = $result->fetchAll(PDO::FETCH_ASSOC);
} else {
    // If the query failed, log the error message
    error_log("Failed to fetch products: " . $conn->errorInfo()[2]);
}

// Close the database connection
$conn = null;
?>

<!DOCTYPE html>
<html>
<head>
    <title>Produtos - SKASTR</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
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
            </ul>
        </nav>
    </header>
    <main>
        <section class="products">
            <h2>Nossos Produtos</h2>
            <?php if (isset($products)): ?>
                <?php foreach ($products as $product): ?>
                    <div class="product">
                        <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>">
                        <h3><?php echo $product['name']; ?></h3>
                        <p><?php echo $product['description']; ?></p>
                        <span class="price"><?php echo $product['price']; ?></span>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Nenhum produto encontrado.</p>
            <?php endif; ?>
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Skaeno System. Todos os direitos reservados.</p>
    </footer>
</body>
</html>