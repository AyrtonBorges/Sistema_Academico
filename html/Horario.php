<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Horario</title>
        <style>
            .button{
                height: 300px;
                width: 400px;
            }
        </style>
</head>
<body>
    <h1>Horário de Atendimento</h1>
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
    <a href="novohorario.php"><button>Adicionar</button></a>
    <a href="removerhorario.php"><button>Remover</button></a>
    <a href="index.php"><button>Voltar</button></a>
    <?php
    $consulta = mysqli_query($conexao, "SELECT * FROM horario_atendimento");

    echo '<table border=1>
            <tr>
                <th>id</th>
                <th>Data Inicial</th>
                <th>Data Final</th>
                <th>Horario Inicial</th>
                <th>Horario Final</th>
                <th>Alterações</th>
            </tr>';

    while($linha = mysqli_fetch_array($consulta))
    {
        echo '<tr> 
                <td>'.$linha['id'].'</td>
                <td>'.$linha['data_ini'].'</td>
                <td>'.$linha['data_fim'].'</td>
                <td>'.$linha['horario_ini'].'</td>
                <td>'.$linha['horario_fim'].'</td>
                <td>
                    <form action="updatehorario.php" method="POST">
                        <input type="hidden" name="id" value='.$linha['id'].'>
                        <input type="submit" value="Update">
                    </form>
                </td>
                </tr>';
    }

    echo '</table>';
    ?>
    </body>
</html>