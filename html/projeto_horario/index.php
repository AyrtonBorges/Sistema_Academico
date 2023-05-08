<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>horario</title>
        <style>
            .button{
                height: 300px;
                width: 400px;
            }
        </style>
</head>
<body>
    <h1>Projeto & Horario</h1>
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
    <a href="novo.php"><button>Adicionar</button></a>
    <a href="remover.php"><button>Remover</button></a>
    <a href="../index.php"><button>Voltar</button></a>
    <?php
    $consulta = mysqli_query($conexao, "SELECT * FROM projeto_horario");

    echo '<table border=1>
            <tr>
                <th>ID projeto</th>
                <th>ID horario</th>
            </tr>';

    while($linha = mysqli_fetch_array($consulta))
    {
        echo '<tr> 
                <td>'.$linha['id_projeto'].'</td>
                <td>'.$linha['id_horario'].'</td>
                </tr>';
    }

    echo '</table>';
    ?>
    </body>
</html>