class Imc {
  static String getStatus(double imc) {
    if (imc < 16) {
      return 'magreza grave';
    } else if (imc < 17) {
      return 'magreza moderada';
    } else if (imc < 18.5) {
      return 'magreza leve';
    } else if (imc < 25) {
      return 'saudável';
    } else if (imc < 30) {
      return 'sobrepeso';
    } else if (imc < 35) {
      return 'obesidade grau I';
    } else if (imc < 40) {
      return 'obesidade grau II (severa)';
    } else {
      return 'obesidade grau III (mórbida)';
    }
  }
}
