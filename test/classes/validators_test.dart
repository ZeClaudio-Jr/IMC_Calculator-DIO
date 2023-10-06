import 'package:calculadora_imc/classes/validators.dart';
import 'package:test/test.dart';

void main() {
  group('double validators', () {
    group('double is positive', () {
      test('retorna true quando o número é positivo', () {
        expect(Validators.doubleIsPositive(0.0001), true);
      });

      test('retorna true quando o número é zero', () {
        expect(Validators.doubleIsPositive(0), true);
      });

      test('retorna false quando o número é negativo', () {
        expect(Validators.doubleIsPositive(-0.0001), false);
      });
    });

    group('double is grather than', () {
      test('funciona com número positivo', () {
        expect(Validators.doubleIsGreaterThan(0.0001, 0), true);
      });

      test('funcion com número negativo', () {
        expect(Validators.doubleIsGreaterThan(-0.000001, -0.00001), true);
      });

      test('retorna false quando o número é igual', () {
        expect(Validators.doubleIsGreaterThan(0.0001, 0.0001), false);
      });

      test('retorna true quando o número é maior', () {
        expect(Validators.doubleIsGreaterThan(0.00011, 0.0001), true);
      });

      test('retorna false quando o número é menor', () {
        expect(Validators.doubleIsGreaterThan(0.00009, 0.0001), false);
      });
    });
  });
}
