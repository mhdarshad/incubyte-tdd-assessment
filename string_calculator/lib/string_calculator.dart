class StringCalculator {
  int _callCount = 0;

  int add(String numbers) {
    _callCount++;
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numPart = numbers;

    if (numbers.startsWith('//')) {
      final split = numbers.split('\n');
      final delimiterPart = split[0].substring(2);
      if (delimiterPart.startsWith('[') && delimiterPart.endsWith(']')) {
        delimiter = delimiterPart.substring(1, delimiterPart.length - 1);
      } else {
        delimiter = delimiterPart;
      }
      numPart = split.sublist(1).join('\n');
    }

    numPart = numPart.replaceAll('\n', delimiter);
    final parts = delimiter.isNotEmpty ? numPart.split(delimiter) : [numPart];
    final nums = parts.map(int.parse).where((n) => n <= 1000).toList();

    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(",")}');
    }

    return nums.isEmpty ? 0 : nums.reduce((a, b) => a + b);
  }

  int getCalledCount() {
    return _callCount;
  }
}
