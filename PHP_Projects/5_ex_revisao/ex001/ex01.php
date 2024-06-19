<?php

    $largura = $_POST["largura"];
    $comprimento = $_POST["comprimento"]; 

    $area = $largura * $comprimento;

    printf("A área do terreno é: %.2f m²\n", $area);

    if ($area < 100) {
        echo "Classificação: TERRENO POPULAR\n";
    } else if ($area <= 500) {
        echo "Classificação: TERRENO MASTER\n";
    } else {
        echo "Classificação: TERRENO VIP\n";
    }

?>