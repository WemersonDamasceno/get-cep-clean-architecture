import 'package:dartz/dartz.dart';
import 'package:flutter_modular_example/core/errors/exceptions.dart';
import 'package:flutter_modular_example/core/errors/failures.dart';
import 'package:flutter_modular_example/data/datasources/cep_datasource.dart';
import 'package:flutter_modular_example/domain/entities/cep_entity.dart';
import 'package:flutter_modular_example/domain/repositories/cep_repository.dart';

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
