import 'package:get_cep_clean_arch/data/models/github/github_user_model.dart';

abstract class GithubDatasource {
  Future<GithubModel> getGithubUser(String githubUser);
}
