import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/presentation/features/home/home_module.dart';
//import 'package:flutter_modular_example/app/routes/app_routes.dart';
//import 'modules/search_cep/cep_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
