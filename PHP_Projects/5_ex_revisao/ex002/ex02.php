<?php  
    $nome = $_POST['nome']; 
    $salario = $_POST['salario']; 
    $anos_empresa = $_POST['anos_empresa'];
    
    if ($anos_empresa <= 3) 
    { 
        $novo_salario = $salario * 1.03; 
    } else if ($anos_empresa <= 10) 
    { 
        $novo_salario = $salario * 1.125; 
    }else 
    { 
        $novo_salario = $salario * 1.2;
    } 
    echo ("<h1>Resultado</h1>");
    echo ("<p>Nome do funcionário: $nome</p>");
    echo ("<p>Salário atual: R$$salario.</p>"); 
    echo ("<p>Anos na empresa: $anos_empresa</p>"); 
    echo ("<p>Novo salário: R$$novo_salario"."</p>");
?>