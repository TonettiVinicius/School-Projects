<?php 
$tipo_carro = $_POST['tipo_carro'];
$dias_aluguel = intval($_POST['dias_aluguel']);
$km_percorridos = intval($_POST['km_percorridos']);

if ($tipo_carro == "popular") 
{
    $valor_aluguel = $dias_aluguel * 90;
    if ($km_percorridos <= 100) {
        $valor_km = $km_percorridos * 0.20;
    } else {
        $valor_km = ($km_percorridos - 100) * 0.10 + 100 * 0.20;
    }
} else 
{
    $valor_aluguel = $dias_aluguel * 150;
    if ($km_percorridos <= 200) {
        $valor_km = $km_percorridos * 0.30;
    } else {
        $valor_km = ($km_percorridos - 200) * 0.25 + 200 * 0.30;
    }
}
echo ("<h1>Resultado</h1>");
echo ("<p>Valor do alugue)l: R$$valor_aluguel</p>");
echo ("<p>Valor por Km percorrido: R$$valor_km</p>");
echo ("<p>Valor total a ser pago: R$ " . ($valor_aluguel + $valor_km)."</p>");
