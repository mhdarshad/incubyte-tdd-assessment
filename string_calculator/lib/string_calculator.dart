class StringCalculator {
  int _callCount = 0;

  int add(String numbers) {
    _callCount++;
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numPart = numbers;

    if (numbers.startsWith('//')) {
      final split = numbers.split('\n');
      delimiter = split[0].substring(2);
      numPart = split.sublist(1).join('\n');
    }

    numPart = numPart.replaceAll('\n', delimiter);
    final parts = numPart.split(delimiter);
    final nums = parts.map(int.parse).toList();

    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(",")}');
    }

    return nums.reduce((a, b) => a + b);
  }

  int getCalledCount() {
    return _callCount;
  }
}
