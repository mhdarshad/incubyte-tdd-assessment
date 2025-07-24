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
    expect(
      () => calculator.add('1,-2,3,-5'),
      throwsA(
        predicate(
          (e) => e.toString().contains('negative numbers not allowed: -2,-5'),
        ),
      ),
    );
  });
  test('GetCalledCount returns the number of times add() was invoked', () {
    final calc = StringCalculator();
    expect(calc.getCalledCount(), equals(0));
    calc.add('1,2');
    expect(calc.getCalledCount(), equals(1));
    calc.add('3');
    expect(calc.getCalledCount(), equals(2));
  });

  test('Numbers bigger than 1000 should be ignored', () {
    expect(calculator.add('2,1001'), equals(2));
    expect(calculator.add('1000,2'), equals(1002));
    expect(calculator.add('1234,1,1001,3'), equals(4));
  });

  test('Delimiters can be of any length with //[delimiter]\\n format', () {
    expect(calculator.add('//[***]\n1***2***3'), equals(6));
    // expect(calculator.add('//[abc]\n4abc5abc6'), equals(15));
  });

  test('Allow multiple delimiters of any length with //[delim1][delim2]\\n format', () {
    expect(calculator.add('//[*][%]\n1*2%3'), equals(6));
    expect(calculator.add('//[***][#][%]\n1***2#3%4'), equals(10));
  });
}
