import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/presentation/features/search_cep/cubit/cep_cubit.dart';
import 'package:flutter_modular_example/presentation/features/search_cep/cubit/cep_state.dart';

class CepPage extends StatelessWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CepCubit cepCubit = Modular.get();
    final cepController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Cep')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text('Informe o CEP', style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: cepController,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                child: const Text("Buscar"),
                onPressed: () {
                  cepCubit.getCep(cepController.text);
                },
              ),
            ),
            const SizedBox(height: 16),
            BlocProvider<CepCubit>(
              create: (context) => cepCubit,
              child: BlocBuilder<CepCubit, CepState>(
                builder: (context, state) {
                  if (state is CepLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is CepLoaded) {
                    return Expanded(
                      child: Column(
                        children: [
                          Text(state.cepResponse.bairro),
                          Text(state.cepResponse.cep),
                          Text(state.cepResponse.complemento),
                          Text(state.cepResponse.localidade),
                          Text(state.cepResponse.logradouro),
                          Text(state.cepResponse.uf),
                        ],
                      ),
                    );
                  }
                  if (state is CepError) {
                    return Text(state.error);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
