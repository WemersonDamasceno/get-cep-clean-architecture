import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_cep_clean_arch/presentation/features/github/cubit/github_cubit.dart';

class GithubPage extends StatelessWidget {
  const GithubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userTextController = TextEditingController();
    final githubCubit = Modular.get<GithubCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: userTextController,
            decoration: const InputDecoration(
              labelText: 'Username Github',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            child: const Text('Get Github User'),
            onPressed: () {
              githubCubit.getGithubUser(userTextController.text);
            },
          ),
          BlocProvider(
            create: (context) => githubCubit,
            child: BlocBuilder<GithubCubit, GithubState>(
              builder: (context, state) {
                if (state is GithubInitial) {
                  return Center(child: Container());
                }
                if (state is GithubLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is GithubLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  Image.network(state.githubEntity.avatarUrl),
                            )),
                        Text(state.githubEntity.id.toString()),
                        Text(state.githubEntity.name),
                        Text(state.githubEntity.bio),
                        Text(state.githubEntity.location),
                        Text(state.githubEntity.company),
                        Text("Followers: ${state.githubEntity.followers}"),
                        Text("Following: ${state.githubEntity.following}"),
                        Text("Repositorios: ${state.githubEntity.publicRepos}"),
                        Text("Tipo de conta: ${state.githubEntity.type}"),
                      ],
                    ),
                  );
                }
                if (state is GithubError) {
                  return Text(state.error);
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
