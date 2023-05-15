<?php
    $id = 0;
    if($id == 0)
    {
        echo '<!DOCTYPE html>
        <html lang="pt-br">
            <head>
                <title> Projetos & Atendimentos </title>
                <meta charset="UTF-8">
                <style>
                    .button1{
                        padding: 15px 50px;
                        font-size: medium;
                    }
                    .fieldset1{
                        text-align: center;
                        width: 400px;
                        margin: auto;
                    }
                </style>
            </head>
            <body>
                <form id="meuFormulario" name="meuFormulario" method="POST">
                    <fieldset class="fieldset1">
                        <p><b>ID pessoa:</b><input type="text" name="id"required> <br> </p>
                        <a href="Projeto.php"><button type="submit" class="button1">Salvar ID</button></a>
                    </fieldset>
                </form>
                
            </body>
        </html>';
    }
    if(isset($_POST['id']))
    {
        echo '<!DOCTYPE html>
        <html lang="pt-br">
            <head>
                <title> Projetos & Atendimentos </title>
                <meta charset="UTF-8">
                <style>
                    .button1{
                        padding: 15px 70px;
                        font-size: medium;
                    }
                    .fieldset1{
                        text-align: center;
                        width: 400px;
                        margin: auto;
                    }
                </style>
            </head>
            <body>
                
                    <fieldset class="fieldset1">
                        <form id="meuFormulario" name="meuFormulario" action="Projeto.php" method="POST">
                            <input type="hidden" name="id" value="'.$_POST["id"].'">
                            <a href="Projeto.php"><button type="submit" class="button1">Projetos</button></a>
                        </form>
                    </fieldset>
                
                
            </body>
        </html>';
    }
?>
