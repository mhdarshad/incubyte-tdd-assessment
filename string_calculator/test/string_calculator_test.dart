import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

    test('Empty string returns 0', () {
      expect(calculator.add(''), equals(0));
    });

    test('Single number returns the number', () {
      expect(calculator.add('1'), equals(1));
    });

    test('Two numbers returns the sum', () {
      expect(calculator.add('1,5'), equals(6));
    });

}