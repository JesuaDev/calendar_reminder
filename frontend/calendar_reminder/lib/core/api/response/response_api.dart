class ResponseApi<T> {
  final String? message;
  final int? statusCode;
  final T data;

  ResponseApi({this.message, this.statusCode, required this.data});

  ResponseApi<R> map<R>(R Function(T data) transform) => ResponseApi(
    message: message,
    statusCode: statusCode,
    data: transform(data),
  );
}
