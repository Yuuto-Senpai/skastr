Projeto desempenhado por Gabriel Bueno e Nayumy Skawranski

Orientadores: Reinaldo da Silva Cândido, Célia Kouth Cabral e Aparecida da Silva Ferreira.

por texto; Introdução
Visão Geral
O projeto consiste na criação de um site para atender pequenas e microempresas, proporcionando uma plataforma onde podem exibir produtos ou serviços, interagir com clientes e facilitar transações comerciais. A plataforma contará com recursos como comércio eletrônico, gerenciamento de inventário e relações com clientes (CRM).

Propósito
O propósito deste projeto é oferecer uma solução online acessível para empresas de menor porte que desejam expandir sua presença digital. Diferentemente de outras soluções de mercado, nosso projeto oferece um nível de personalização e suporte que é específico para as necessidades das PMEs.

Contexto
No cenário atual, a presença online é crucial para o sucesso das empresas. De acordo com estatísticas recentes,(pesquisar), muitas pequenas e microempresas enfrentam desafios para desenvolver suas próprias plataformas online devido a restrições de recursos.

Relevância para Pequenas Empresas
Este projeto se alinha com a crescente importância das pequenas e microempresas na economia, fornecendo um espaço digital inclusivo para essas empresas alcançarem seus objetivos comerciais.

Tecnologias Utilizadas
Linguagens de Programação
PHP: Utilizado para desenvolvimento do lado do servidor, permitindo a criação de páginas dinâmicas e interação com bancos de dados.
HTML/CSS: Usados para a estruturação e estilização do site.
Banco de Dados
PostgreSQL: Escolhido por sua robustez e escalabilidade, o PostgreSQL pode suportar volumes substanciais de dados.
Ferramentas de Desenvolvimento
Editor de Texto/IDE: Visual Studio Code
SGBD Cliente: Usado para gerenciar o banco de dados PostgreSQL, PGADMIN 4.
Considerações de Segurança
Hashing de Senha: Implementado para segurança no armazenamento de senhas.
Prevenção de SQL Injection: Consultas SQL parametrizadas para aumentar a segurança.
Validação de Entrada do Usuário: Implementada para evitar vulnerabilidades como XSS.
Versionamento
O projeto utiliza Git para controle de versão, facilitando o rastreamento de mudanças e colaborações.

Testes
Métodos de teste automatizados serão utilizados para garantir a funcionalidade e segurança do site.

Arquitetura do Sistema
Um diagrama de arquitetura será fornecido para ilustrar a interação entre os diversos componentes do sistema.
Arquitetura do Sistema
Arquitetura Geral
O projeto foi desenvolvido seguindo o modelo de arquitetura cliente-servidor. Nesta configuração, o cliente (o navegador web do usuário) faz solicitações a um servidor web, que, por sua vez, processa essas solicitações, interage com o banco de dados e retorna páginas HTML dinâmicas ao cliente.

Diagrama de Arquitetura

O diagrama acima ajuda a visualizar como os diversos componentes do sistema interagem entre si. Isso inclui o fluxo de dados entre o cliente, o servidor e o banco de dados, bem como qualquer outra entidade relevante.

Fluxo de Informações

Solicitação do Cliente: Quando um usuário acessa o site, seu navegador envia solicitações HTTP para o servidor web para acessar páginas específicas, como a página inicial ou a página de produtos.

Processamento no Servidor: As solicitações são então encaminhadas ao PHP para processamento.

PHP e Banco de Dados: O PHP interage com o banco de dados PostgreSQL para recuperar informações relevantes, como detalhes de produtos ou informações de usuário.

Resposta ao Cliente: O servidor, então, envia a página HTML gerada de volta ao cliente para ser renderizada no navegador.

Especificações Técnicas
Servidor: Utilizamos servidores Linux com suporte a Apache.
Requisitos de Armazenamento: O PostgreSQL está configurado para funcionar com um armazenamento mínimo de 20 GB.
Vantagens da Arquitetura
Escalabilidade: A natureza descentralizada da arquitetura cliente-servidor permite uma fácil escalabilidade.
Separação de Responsabilidades: A lógica do servidor (PHP) e a interface do usuário (HTML/CSS) são mantidas separadas, facilitando a manutenção e atualizações.
Desafios e Estratégias de Segurança
Cross-Site Scripting (XSS)
Para mitigar o risco de ataques XSS, todas as entradas dos usuários são validadas e filtradas, evitando a execução de scripts maliciosos.

SQL Injection
Consultas parametrizadas são utilizadas para evitar ataques de SQL Injection.

Monitoramento e Manutenção
O sistema possui um logging abrangente para rastrear erros e atividades suspeitas. Os problemas são regularmente revisados e corrigidos para garantir a operação contínua do sistema.

Estratégias de Caching e Otimização
Para melhorar o desempenho e a eficiência, implementamos um sistema de caching no lado do servidor. Isso ajuda a reduzir os tempos de carregamento e minimiza a carga sobre o banco de dados.

Integração Contínua e Entrega Contínua (CI/CD)
Utilizamos uma pipeline de CI/CD para automatizar o processo de testes e implantação, garantindo que apenas códigos testados sejam movidos para o ambiente de produção.
Seção de Requisitos
Requisitos Funcionais
Exibição de Produtos
Descrição: O sistema deve permitir que as empresas cadastradas listem seus produtos ou serviços.
Critérios de Aceitação: Cada listagem deve conter nome do produto, descrição, preço e imagem (opcional).
Páginas de Detalhes
Descrição: Cada produto ou serviço deve possuir uma página de detalhes própria.
Critérios de Aceitação: A página deve fornecer informações adicionais como avaliações, comentários e opções de customização.
Pesquisa de Produtos
Descrição: Os usuários devem ser capazes de pesquisar produtos.
Critérios de Aceitação: A pesquisa pode ser realizada por nome do produto, categoria, e outros filtros relevantes como faixa de preço.
Formulário de Contato
Descrição: O site deve oferecer um formulário de contato.
Critérios de Aceitação: Os usuários devem ser capazes de enviar mensagens às empresas através de um formulário de contato seguro.
Área de Login
Descrição: O sistema deve oferecer uma área de login segura.
Critérios de Aceitação: Empresas e usuários devem ser capazes de acessar suas contas através de um processo de autenticação seguro, preferencialmente com autenticação de dois fatores.
Requisitos Não Funcionais
Desempenho
Descrição: Tempos de carregamento aceitáveis em diferentes tipos de conexão.
Critérios de Aceitação: O site deve ser completamente carregado em no máximo 3 segundos em uma conexão de banda larga.
Usabilidade
Descrição: Interface intuitiva.
Critérios de Aceitação: O site deve passar em testes de usabilidade, obtendo uma pontuação acima de 80% em métricas de satisfação do usuário.
Segurança
Descrição: Proteção de dados dos usuários e empresas.
Critérios de Aceitação: O site deve implementar HTTPS, criptografia e hashing de senhas.
Compatibilidade
Descrição: Funcional em múltiplos dispositivos e navegadores.
Critérios de Aceitação: O site deve ser responsivo e compatível com os últimos 2 anos de versões de navegadores populares.
Casos de Uso
Registrar Empresa: Empresas podem se registrar fornecendo detalhes como nome, endereço, e outros.
Listar Produtos: Empresas registradas podem listar produtos.
Pesquisar Produtos: Usuários podem buscar produtos.
Enviar Mensagem: Usuários podem enviar mensagens às empresas.
Acessar Área de Login: Empresas podem fazer login para gerenciar suas listas de produtos e visualizar mensagens recebidas.