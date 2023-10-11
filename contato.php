<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Contato</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
        <ul>
                <li><a href="index.php">Início</a></li>
                <li><a href="produto.php">Produtos</a></li>
                <li><a href="servico.php">Serviços</a></li>
                <li><a href="sobrenos.php">Sobre Nós</a></li>
                <li><a href="contato.php">Contato</a></li>
                <li><a href="new_product.php">REMOVER DEPOIS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section class="contact">
            <h2>Entre em Contato</h2>
            <form action="send_email.php" method="post">
                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" name="nome" required>
                </div>
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="assunto">Assunto:</label>
                    <input type="text" id="assunto" name="assunto" required>
                </div>
                <div class="form-group">
                    <label for="mensagem">Mensagem:</label>
                    <textarea id="mensagem" name="mensagem" required></textarea>
                </div>
                <div class="form-group">
                    <button type="submit">Enviar</button>
                    <button type="reset">Limpar</button>
                </div>
            </form>
        </section>
    </main>
    <footer>
        <ul>
        <li><a href="index.php">Início</a></li>
            <li><a href="#">Produtos</a></li>
            <li><a href="#">Serviços</a></li>
            <li><a href="#">Sobre Nós</a></li>
            <li><a href="#">Contato</a></li>
        </ul>
        <p>&copy; 2023 Skaeno System. Todos os direitos reservados.</p>
    </footer>
</body>
</html>