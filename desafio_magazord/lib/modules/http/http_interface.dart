import 'package:desafio_magazord/modules/http/response_http.dart';

abstract class IHTTP {
  Future<ResponseHTTP> get(String url);

  void injectTest(ResponseHTTP response);
}
