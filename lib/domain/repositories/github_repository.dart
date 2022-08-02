import 'package:dartz/dartz.dart';
import 'package:get_cep_clean_arch/core/errors/failures.dart';
import 'package:get_cep_clean_arch/domain/entities/github_user_entity.dart';

abstract class GithubRepository {
  Future<Either<Failure, GithubEntity>> getGithubUser(String githubUser);
}
