import 'dart:convert';

import 'package:get_cep_clean_arch/core/errors/exceptions.dart';
import 'package:get_cep_clean_arch/core/http_client/http_client.dart';
import 'package:get_cep_clean_arch/data/datasources/github/github_datasource.dart';
import 'package:get_cep_clean_arch/data/models/github/github_user_model.dart';

class GithubDatasourceImp implements GithubDatasource {
  final HttpClient _httpClient;

  GithubDatasourceImp(this._httpClient);

  @override
  Future<GithubModel> getGithubUser(String githubUser) async {
    final response =
        await _httpClient.get("https://api.github.com/users/$githubUser");

    final json = jsonDecode(response.data);
    if (response.statusCode == 200) {
      return GithubModel.fromJson(json);
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else {
      throw Exception();
    }
  }
}
