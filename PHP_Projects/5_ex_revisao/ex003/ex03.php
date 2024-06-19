<?php

$valor_casa = $_POST['valor_casa'];
$salario = $_POST['salario'];
$anos_pagamento = $_POST['anos_pagamento'];

$prestacao_mensal = $valor_casa / ($anos_pagamento * 12);

if ($prestacao_mensal <= ($salario * 0.3)) {
    $mensagem = ("Empréstimo aprovado! Prestação mensal: R$ $prestacao_mensal");
} else {
    $mensagem = ("Empréstimo negado! Prestação mensal excede 30% do salário.");
}

echo ("<h1>Resultado</h1>");
echo ("<p>$mensagem</p>");

?>