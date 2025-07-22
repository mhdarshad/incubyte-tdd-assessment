import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string returns 0', () {
    expect(calculator.add(''), equals(0));
  });
}