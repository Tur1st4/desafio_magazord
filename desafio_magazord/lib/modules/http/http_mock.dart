import 'package:desafio_magazord/modules/http/http_interface.dart';
import 'package:desafio_magazord/modules/http/response_http.dart';

class HTTPMock extends IHTTP {
  static ResponseHTTP? _response;

  @override
  Future<ResponseHTTP> get(String url) async {
    return _response!;
  }

  @override
  void injectTest(ResponseHTTP response) {
    _response = response;
  }
}
