<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Projeto</title>
    </head>
    <body>
        <h1>Projeto</h1>
        <?php
            // Configuração da conexão com o banco de dados
            $host= "localhost";
            $user= "root";
            $password= "root";
            $database= "Sistema_Academico";
            $conn= mysqli_connect($host, $user, $password, $database);
            if (!$conn) {
            die("Erro ao conectar ao banco de dados: " .
            mysqli_connect_error());
            }

            // Seleciona todos os dados da tabela "projeto"
            $query="SELECT * FROM projeto";
            $result= mysqli_query($conn, $query);
            if (!$result) {
            die("Erro ao selecionar dados da tabela projeto: " .
            mysqli_error($conn));
            }
            ?>
            <?php
            // Insere novos dados na tabela "projeto" se o formulário for enviado
                if (isset($_POST["titulo"])) {
                    $titulo = $_POST["titulo"];
                    $descricao = $_POST["descricao"];
                    $data_inicial = $_POST["data_inicial"];
                    $data_fim = $_POST["data_fim"];

                    $query = 'INSERT INTO projeto (titulo, descricao, data_inicial,
                    data_fim) VALUES ("$titulo", "$descricao", "$data_inicial",
                    "$data_fim")';
                    $result = mysqli_query($conn, $query);
                    if (!$result) {
                        die("Erro ao inserir dados na tabela projeto: ".mysqli_error($conn));
                }else{
                    echo "Não foi efetuado com sucesso!";
                }
            }
            ?>

            <!-- Formulário para inserir novos dados na tabela "projeto" -->
            <h2>Novo Projeto</h2>
            <form method="post" action="">
                <label for="titulo">Título:</label>
                <input type="text" name="titulo" required>
                <br>
                <label for="descricao">Descrição:</label>
                <textarea name="descricao" required></textarea>
                <br>
                <label for="data_inicial">Data Inicial:</label>
                <input type="datetime-local" name="data_inicial" required>
                <br>
                <label for="data_fim">Data Final:</label>
                <input type="datetime-local" name="data_fim" required>
                <br>
                <input type="submit" value="Inserir">
            </form>

            <?php
                // Fecha a conexão com o banco de dados
                mysqli_close($conn);
                ?>
            </body>
        </html>
