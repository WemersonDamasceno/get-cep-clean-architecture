import 'package:flutter_modular_example/core/http_client/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImp implements HttpClient {
  @override
  Future<HttpResponse> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return HttpResponse(statusCode: response.statusCode, data: response.body);
  }
}
