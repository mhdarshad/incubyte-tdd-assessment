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
  test('Handle new lines as valid delimiters between numbers', () {
    expect(calculator.add('1\n2,3'), equals(6));
  });
  test('Support custom delimiter with //;\\n syntax', () {
    expect(calculator.add('//;\n1;2'), equals(3));
  });
    test('Throw exception when negative numbers are passed', () {
    expect(() => calculator.add('1,-2,3,-5'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed: -2,-5'))));
  });
}