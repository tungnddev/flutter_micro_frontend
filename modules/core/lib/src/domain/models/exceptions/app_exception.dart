class AppException implements Exception {
  AppException([this._message = ""]);
  final dynamic _message;

  @override
  String toString() {
    return "$_message";
  }
}
