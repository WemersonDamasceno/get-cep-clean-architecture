import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_cep_clean_arch/core/http_client/http_client.dart';
import 'package:get_cep_clean_arch/core/http_client/http_client_imp.dart';
import 'package:get_cep_clean_arch/data/datasources/github/github_datasource.dart';
import 'package:get_cep_clean_arch/data/datasources/github/github_datasource_imp.dart';
import 'package:get_cep_clean_arch/data/repositories/github/github_repository_imp.dart';
import 'package:get_cep_clean_arch/domain/repositories/github_repository.dart';
import 'package:get_cep_clean_arch/domain/usecases/get_github_user_usecase.dart';
import 'package:get_cep_clean_arch/presentation/features/github/cubit/github_cubit.dart';
import 'package:get_cep_clean_arch/presentation/features/github/pages/github_page.dart';

class GithubModule extends Module {
  @override
  List<Bind> get binds => [
        // Binds for the Cubit
        Bind.factory((i) => GithubCubit(i<GetGithubUserUsecase>())),

        // Binds for the usecases
        Bind<GetGithubUserUsecase>((i) => GetGithubUserUsecase(i())),

        // Binds for the repositories
        Bind<GithubRepository>(
            (i) => GithubRepositoryImp(i.get<GithubDatasource>())),

        // Binds for the datasources
        Bind<GithubDatasource>((i) => GithubDatasourceImp(i.get<HttpClient>())),

        // Binds for the http client
        Bind<HttpClient>((i) => HttpClientImp()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const GithubPage(),
    ),
  ];
}
