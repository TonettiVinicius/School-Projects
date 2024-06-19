<html>
    <table border="1" align="center">
        <tr>
            <th>Id_usuario</th>
            <th>nome</th>
            <th>login</th>
            <th>senha</th>
            <th>tipo</th>
            <th>Editar</th>
            <th>Excluir</th>
        </tr>

        <?php
            include("./connect.php");

            $sql = "SELECT * FROM usuario";
            $res = mysqli_query($id, $sql);

            while ($linha = mysqli_fetch_array($res)) { ?>
                <tr>
                    <td><?php echo $linha['Id_usuario'];?></td>
                    <td><?php echo $linha['nome'];?></td>
                    <td><?php echo $linha['login'];?></td>
                    <td><?php echo $linha['senha'];?></td>
                    <td><?php echo $linha['tipo'];?></td>

                    <td align="center">
                        <a href='form_edita_usuario.php?id_usuario=
                        <?php echo $linha['id_usuario'];?>'>
                        <img src="img/EditarArmario.png" height="50px">
                    </td>

                    <td align="center">
                        <a href='deleta_usuario.php?id_usuario=
                        <?php echo $linha['id_usuario'];?>'>
                            <img src="img/ExcluirArmario.png" height="50px">
                        </a>
                    </td>
                </tr>
        <?php } ?>
    </table>

    <a href="cadastro.html">
        <button align="center">Cadastrar Usuario</button>
    </a>
</html>