import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/core/http_client/http_client.dart';
import 'package:flutter_modular_example/core/http_client/http_client_imp.dart';
import 'package:flutter_modular_example/data/datasources/cep_datasource.dart';
import 'package:flutter_modular_example/data/datasources/via_cep_datasource/via_cep_datasource.dart';
import 'package:flutter_modular_example/data/repositories/cep_repository.dart';
import 'package:flutter_modular_example/domain/repositories/cep_repository.dart';
import 'package:flutter_modular_example/domain/usecases/get_cep_usecase.dart';
import 'package:flutter_modular_example/presentation/features/search_cep/cubit/cep_cubit.dart';
import 'package:flutter_modular_example/presentation/features/search_cep/pages/cep_page.dart';

class CepModule extends Module {
  @override
  List<Bind> get binds => [
        // Binds for the Cubit
        Bind.factory((i) => CepCubit(i.get<GetCepUseCase>())),
        // Binds for the usecases
        Bind.lazySingleton((i) => GetCepUseCase(i.get<CepRepository>())),
        // Binds for the repository
        Bind.lazySingleton((i) => CepRepositoryImp(i.get<CepDatasource>())),
        // Binds for the datasource
        Bind.lazySingleton((i) => ViaCepDatasource(i.get<HttpClient>())),
        // Binds for the http client
        Bind.lazySingleton((i) => HttpClientImp()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const CepPage(),
    ),
  ];
}
