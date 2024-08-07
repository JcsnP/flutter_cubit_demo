import 'package:dio/dio.dart';

class Api {
  static final Api _instance = Api._();

  final http = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  factory Api() {
    return _instance;
  }

  Api._() {
    http.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //
          return handler.next(options);
        },
      ),
    );
  }
}
