import 'package:dartz/dartz.dart';
import 'package:get_cep_clean_arch/core/errors/exceptions.dart';
import 'package:get_cep_clean_arch/core/errors/failures.dart';
import 'package:get_cep_clean_arch/data/datasources/github/github_datasource.dart';
import 'package:get_cep_clean_arch/domain/entities/github_user_entity.dart';
import 'package:get_cep_clean_arch/domain/repositories/github_repository.dart';

class GithubRepositoryImp implements GithubRepository {
  final GithubDatasource _githubDatasource;

  GithubRepositoryImp(this._githubDatasource);

  @override
  Future<Either<Failure, GithubEntity>> getGithubUser(String githubUser) async {
    try {
      final response = await _githubDatasource.getGithubUser(githubUser);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
