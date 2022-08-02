import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_cep_clean_arch/core/routes/app_routes.dart';
import 'package:get_cep_clean_arch/presentation/features/home/pages/home_page.dart';
import 'package:get_cep_clean_arch/presentation/features/search_cep/cep_module.dart';

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
