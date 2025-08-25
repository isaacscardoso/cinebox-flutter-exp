final class DataException implements Exception {
  final String message;

  const DataException({required this.message});

  @override
  String toString() => 'DataException: $message';
}
