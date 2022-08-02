import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_cep_clean_arch/core/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to CEP'),
              onPressed: () {
                Modular.to.pushNamed(AppRoutes.cep);
              },
            ),
            ElevatedButton(
              child: const Text('Go to Github'),
              onPressed: () {
                Modular.to.pushNamed(AppRoutes.github);
              },
            ),
          ],
        ),
      ),
    );
  }
}
