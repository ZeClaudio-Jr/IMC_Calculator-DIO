import 'package:calculadora_imc/classes/cli.dart';
import 'package:calculadora_imc/classes/pessoa.dart';
import 'package:calculadora_imc/classes/validators.dart';
import 'package:calculadora_imc/utils/imc.dart';

void main(List<String> arguments) {
  Pessoa p;
  String nome;
  double altura, peso;

  print("********************************************************************");
  print("________________________ IMC Calculator DIO ________________________");
  print("");
  print("Que bom te ter por aqui, aposto que quer saber seu IMC.");
  print(" Acertei? Responda-me algumas coisinhas. Vamos lá!?");

  print("");
  nome = Cli.lerString(
    mensagem: ">> Me fala seu nome?",
    retornoPadrao: "Usuário",
  );

  print("");
  altura = Cli.lerDouble(
    mensagem: ">> Me diz sua altura, e em metros, certo?(Faça a separação com ponto(.))",
    validadores: [
      Validators.doubleIsPositive,
      (double n) => Validators.doubleIsGreaterThan(n, 0),
    ],
  );

  print("");
  peso = Cli.lerDouble(
    mensagem: ">> Agora, me informe seu peso, em Kg?(Faça a separação com ponto(.))",
    validadores: [
      Validators.doubleIsPositive,
      (double n) => Validators.doubleIsGreaterThan(n, 0),
    ],
  );

  p = Pessoa(nome, altura, peso);

  print("________________________ Seu Resultado ________________________");
  print("Nome: $nome");
  print("Altura: ${altura.toStringAsFixed(2)} m");
  print("Peso: ${peso.toStringAsFixed(2)} Kg");
  print("_______________________________________________________________");
  print("IMC: ${p.imc.toStringAsFixed(2)}");
  print("Status: ${Imc.getStatus(p.imc)}");
  print("_______________________________________________________________");
}
