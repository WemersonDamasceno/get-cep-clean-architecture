import 'dart:convert';

import 'package:flutter_modular_example/core/errors/exceptions.dart';
import 'package:flutter_modular_example/core/http_client/http_client.dart';
import 'package:flutter_modular_example/data/datasources/cep_datasource.dart';
import 'package:flutter_modular_example/data/models/cep_model.dart';

class ViaCepDatasource implements CepDatasource {
  ViaCepDatasource(this._httpClient);
  final HttpClient _httpClient;

  @override
  Future<CEPModel> getCep(String cep) async {
    final response =
        await _httpClient.get("https://viacep.com.br/ws/$cep/json/");

    final json = jsonDecode(response.data);
    if (response.statusCode == 200) {
      return CEPModel.fromJson(json);
    } else {
      return throw const ServerException();
    }
  }
}
