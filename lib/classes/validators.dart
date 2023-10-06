class Validators {
  static bool doubleIsPositive(double num) {
    return !num.isNegative;
  }

  static bool doubleIsGreaterThan(double num, double num2) {
    return num > num2;
  }
}
