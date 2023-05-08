<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Projeto</title>
</head>
<body>
    <h1>Projeto</h1>
    <?php

    $servidor = "localhost";
    $usuario = "root";
    $senha = "root";
    $database = "Sistema_Academico";

    $conexao = mysqli_connect($servidor,$usuario,$senha,$database);

    if(!$conexao)
    {
        echo "Erro ao conectar no banco de dados!";
    }


    $consulta = mysqli_query($conexao, "SELECT * FROM projeto");

    echo '<table border=1>
            <tr>
                <th>id</th>
                <th>Titulo</th>
                <th>Descrição</th>
                <th>data_inicial</th>
                <th>data_final</th>
            </tr>';

    while($linha = mysqli_fetch_array($consulta))
    {
        echo '<tr> 
                <td>'.$linha['id'].'</td>
                <td>'.$linha['titulo'].'</td>
                <td>'.$linha['descricao'].'</td>
                <td>'.$linha['data_inicial'].'</td>
                <td>'.$linha['data_fim'].'</td>
                </tr>';
    }

    echo '</table>';

    if(isset($_POST["titulo"]))
    {
        $titulo = $_POST["titulo"];
        $descricao = $_POST["descricao"];
        $data_inicial = str_replace("T"," ",$_POST["data_inicial"]);
        $data_fim = str_replace("T"," ",$_POST["data_fim"]);

        $query = "INSERT INTO projeto(id, titulo, descricao,data_inicial,data_fim) VALUES (NULL,'".$titulo."','".$descricao."','".$data_inicial."','".$data_fim."')";
        mysqli_query($conexao,$query);
        echo "<meta http-equiv='refresh' content='1'>";
    }
    ?>
    <h2> Novo Projeto </h2>
    <form method="post" action="">
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" required>
        <br>
        <label for="descricao">Descrição:</label>
        <textarea name="descricao" required></textarea>
        <br>
        <labe for="data_inicial">Data Inicial:</label>
        <input type="datetime-local" name="data_inicial" required>
        <br>
        <label type="data_fim">Data Final:</label>
        <input type="datetime-local" name="data_fim" required>
        <br>
        <input type="submit" value="Inserir">
    </form>
    </body>
</html>