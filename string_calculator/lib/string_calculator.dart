class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numPart = numbers;

    // Handle custom delimiter
    if (numbers.startsWith('//')) {
      final split = numbers.split('\n');
      delimiter = split[0].substring(2); // remove `//`
      numPart = split.sublist(1).join('\n'); // join rest lines
    }

    numPart = numPart.replaceAll('\n', delimiter);
    final parts = numPart.split(delimiter);
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}