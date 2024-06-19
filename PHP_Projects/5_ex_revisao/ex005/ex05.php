<?php
  $horas = $_POST['horas'];
  if ($horas <= 10) {
    $pontos = $horas * 2;
  } else if ($horas <= 20) {
    $pontos = $horas * 5;
  } else {
    $pontos = $horas * 10;
  }
  $dinheiro = $pontos * 0.05;
  echo "Você ganhou ". $pontos. " pontos.";
  echo "<br>Você ganhou R$". $dinheiro;
?>