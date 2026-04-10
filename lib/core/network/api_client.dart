import 'dart:convert';

import 'package:http/http.dart' as http;

import '../error/exceptions.dart';

class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<dynamic>> getProducts() async {
    final uri = Uri.parse('https://fakestoreapi.com/products');

    try {
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      }

      throw ServerException(
        'Falha ao carregar produtos. Status code: ${response.statusCode}',
      );
    } catch (error) {
      if (error is ServerException) rethrow;
      throw ServerException('Erro de rede ao buscar produtos.');
    }
  }

  void dispose() {
    _client.close();
  }
}
