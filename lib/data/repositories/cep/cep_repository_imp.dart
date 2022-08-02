import 'package:dartz/dartz.dart';
import 'package:get_cep_clean_arch/core/errors/exceptions.dart';
import 'package:get_cep_clean_arch/core/errors/failures.dart';
import 'package:get_cep_clean_arch/data/datasources/cep/cep_datasource.dart';
import 'package:get_cep_clean_arch/domain/entities/cep_entity.dart';
import 'package:get_cep_clean_arch/domain/repositories/cep_repository.dart';

class CepRepositoryImp implements CepRepository {
  final CepDatasource _cepDatasource;

  CepRepositoryImp(this._cepDatasource);

  @override
  Future<Either<Failure, CepEntity>> getCep(String cep) async {
    try {
      final response = await _cepDatasource.getCep(cep);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
