import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/core/routes/app_routes.dart';
import 'package:flutter_modular_example/presentation/features/home/pages/home_page.dart';
import 'package:flutter_modular_example/presentation/features/search_cep/cep_module.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    //When a module is NOT needed on that page
    ChildRoute(
      AppRoutes.home,
      child: (context, args) => const HomePage(),
    ),

    //When a module is needed on that page
    ModuleRoute(
      AppRoutes.cep,
      module: CepModule(),
    ),
  ];
}
