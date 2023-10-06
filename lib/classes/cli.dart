import 'dart:convert';
import 'dart:io';

class Cli {
  static String lerString({String? mensagem, String? retornoPadrao}) {
    if (mensagem != null) print(mensagem);
    String? entrada = stdin.readLineSync(encoding: utf8);

    if (entrada == null) return retornoPadrao ?? "";
    entrada = entrada.trim();

    if (entrada.isEmpty) return retornoPadrao ?? "";
    return entrada;
  }

  static double lerDouble({
    String? mensagem,
    List<bool Function(double num)> validadores = const [],
  }) {
    bool entradaInvalida = false;
    while (true) {
      if (entradaInvalida) {
        print("[!] Valor inválido, tente novamente");
        print("");
      }

      if (mensagem != null) print(mensagem);
      String? entrada = stdin.readLineSync(encoding: utf8);

      if (entrada == null) {
        entradaInvalida = true;
        continue;
      }
      entrada = entrada.trim();

      if (entrada.isEmpty) {
        entradaInvalida = true;
        continue;
      }
      double? num = double.tryParse(entrada);

      entradaInvalida = num == null || num.isNaN;

      for (var validador in validadores) {
        if (entradaInvalida) break;
        entradaInvalida = !validador(num!);
      }

      if (!entradaInvalida) return num!;
    }
  }
}
