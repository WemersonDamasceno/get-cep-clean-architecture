import 'dart:convert';

import 'package:get_cep_clean_arch/core/errors/exceptions.dart';
import 'package:get_cep_clean_arch/core/http_client/http_client.dart';
import 'package:get_cep_clean_arch/data/datasources/cep/api_constants/api_constants.dart';
import 'package:get_cep_clean_arch/data/datasources/cep/cep_datasource.dart';
import 'package:get_cep_clean_arch/data/models/cep/cep_model.dart';

class ViaCepDatasource implements CepDatasource {
  ViaCepDatasource(this._httpClient, this.apiConstants);
  final HttpClient _httpClient;
  final ApiConstants apiConstants;

  @override
  Future<CEPModel> getCep(String cep) async {
    final response = await _httpClient.get(apiConstants.baseUrl(cep));

    final json = jsonDecode(response.data);
    if (response.statusCode == 200) {
      return CEPModel.fromJson(json);
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else {
      throw Exception();
    }
  }
}
