# String Calculator - Test Report

## Project Overview
This project implements a String Calculator in Dart, following TDD (Test-Driven Development) principles. The calculator parses a string of numbers separated by delimiters and returns their sum, supporting custom delimiters and error handling for negative numbers.

## Test Cases
The following test cases were implemented and passed:

1. **Empty string returns 0**
2. **Single number returns the number**
3. **Two numbers returns the sum**
4. **Handle new lines as valid delimiters between numbers**
5. **Support custom delimiter with `//;\n` syntax**
6. **Throw exception when negative numbers are passed**

## Test Results Screenshot

![All tests passed](string_calculator/test/test_passed.png)

All tests passed successfully, as shown above. 