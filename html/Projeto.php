<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Projeto</title>
        <style>
            .button{
                height: 300px;
                width: 400px;
            }
        </style>
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
    ?>
    <a href="novoprojeto.php"><button>Adicionar</button></a>
    <a href="removerprojeto.php"><button>Remover</button></a>
    <a href="index.php"><button>Voltar</button></a>
    <?php
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
    ?>
    </body>
</html>