import 'package:dartz/dartz.dart';
import 'package:get_cep_clean_arch/core/errors/failures.dart';
import 'package:get_cep_clean_arch/core/usecases/usecase.dart';
import 'package:get_cep_clean_arch/domain/entities/github_user_entity.dart';
import 'package:get_cep_clean_arch/domain/repositories/github_repository.dart';

class GetGithubUserUsecase<St> implements Usecase<GithubEntity, String> {
  final GithubRepository githubRepository;
  GetGithubUserUsecase(this.githubRepository);

  @override
  Future<Either<Failure, GithubEntity>> call(String githubUser) async {
    return await githubRepository.getGithubUser(githubUser);
  }
}
