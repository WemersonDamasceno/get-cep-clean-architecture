import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_cep_clean_arch/domain/entities/github_user_entity.dart';
import 'package:get_cep_clean_arch/domain/usecases/get_github_user_usecase.dart';

part 'github_state.dart';

class GithubCubit extends Cubit<GithubState> {
  final GetGithubUserUsecase getGithubUserUsecase;

  GithubCubit(this.getGithubUserUsecase) : super(GithubInitial());

  void getGithubUser(String user) async {
    emit(GithubLoading());
    final failureOrSucess = await getGithubUserUsecase(user);
    emit(failureOrSucess.fold(
      (failure) => GithubError(failure.toString()),
      (githubUserEntity) => GithubLoaded(githubEntity: githubUserEntity),
    ));
  }
}
