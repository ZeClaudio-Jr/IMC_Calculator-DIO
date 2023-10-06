import 'package:calculadora_imc/utils/imc.dart';
import 'package:test/test.dart';

void main() {
  group('retorna o status correto', () {
    test('retorna "magreza grave" para valores menor que 16', () {
      expect(Imc.getStatus(0), 'magreza grave');
      expect(Imc.getStatus(10), 'magreza grave');
      expect(Imc.getStatus(15.99999), 'magreza grave');
    });

    test('nao retorna "magreza grave" para valores maior que 16', () {
      expect(Imc.getStatus(16), isNot(equals('magreza grave')));
      expect(Imc.getStatus(16.1), isNot(equals('magreza grave')));
      expect(Imc.getStatus(50), isNot(equals('magreza grave')));
    });

    test('retorna "magreza moderada" para intervalo [16, 17[', () {
      expect(Imc.getStatus(16), 'magreza moderada');
      expect(Imc.getStatus(16.99999), 'magreza moderada');
    });

    test(
        'nao retorna "magreza moderada" para valores fora do intervalo [16, 17[',
        () {
      expect(Imc.getStatus(15.99999), isNot(equals('magreza moderada')));
      expect(Imc.getStatus(17), isNot(equals('magreza moderada')));
    });

    test('retorna "magreza leve" para intervalo [17, 18.5[', () {
      expect(Imc.getStatus(17), 'magreza leve');
      expect(Imc.getStatus(18.49999), 'magreza leve');
    });

    test('nao retorna "magreza leve" para valores fora do intervalo [17, 18.5[',
        () {
      expect(Imc.getStatus(16.99999), isNot(equals('magreza leve')));
      expect(Imc.getStatus(18.5), isNot(equals('magreza leve')));
    });

    test('retorna "saudável" para intervalo [18.5, 25[', () {
      expect(Imc.getStatus(18.5), 'saudável');
      expect(Imc.getStatus(24.9999), 'saudável');
    });

    test('nao retorna "saudável" para valores fora do intervalo [18.5, 25[',
        () {
      expect(Imc.getStatus(18.49999), isNot(equals('saudável')));
      expect(Imc.getStatus(25), isNot(equals('saudável')));
    });

    test('retorna "sobrepeso" para intervalo [25, 30[', () {
      expect(Imc.getStatus(25), 'sobrepeso');
      expect(Imc.getStatus(29.9999), 'sobrepeso');
    });

    test('nao retorna "sobrepeso" para valores fora do intervalo [25, 30[', () {
      expect(Imc.getStatus(24.9999), isNot(equals('sobrepeso')));
      expect(Imc.getStatus(30), isNot(equals('sobrepeso')));
    });

    test('retorna "obesidade grau I" para intervalo [30, 35[', () {
      expect(Imc.getStatus(30), 'obesidade grau I');
      expect(Imc.getStatus(34.9999), 'obesidade grau I');
    });

    test(
        'nao retorna "obesidade grau I" para valores fora do intervalo [30, 35[',
        () {
      expect(Imc.getStatus(29.9999), isNot(equals('obesidade grau I')));
      expect(Imc.getStatus(35), isNot(equals('obesidade grau I')));
    });

    test('retorna "obesidade grau II (severa)" para intervalo [35, 40[', () {
      expect(Imc.getStatus(35), 'obesidade grau II (severa)');
      expect(Imc.getStatus(39.9999), 'obesidade grau II (severa)');
    });

    test(
        'nao retorna "obesidade grau II (severa)" para valores fora do intervalo [35, 40[',
        () {
      expect(
          Imc.getStatus(34.9999), isNot(equals('obesidade grau II (severa)')));
      expect(Imc.getStatus(40), isNot(equals('obesidade grau II (severa)')));
    });

    test('retorna "obesidade grau III (mórbida)" para intervalo [40, +[', () {
      expect(Imc.getStatus(40), 'obesidade grau III (mórbida)');
      expect(Imc.getStatus(10000), 'obesidade grau III (mórbida)');
    });

    test(
        'nao retorna "obesidade grau III (mórbida)" para valores fora do intervalo [40, +[',
        () {
      expect(Imc.getStatus(39.9999),
          isNot(equals('obesidade grau III (mórbida)')));
      expect(Imc.getStatus(-50), isNot(equals('obesidade grau III (mórbida)')));
    });
  });
}
