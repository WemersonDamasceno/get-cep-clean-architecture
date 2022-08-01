import 'package:dartz/dartz.dart';
import 'package:flutter_modular_example/core/errors/failures.dart';
import 'package:flutter_modular_example/domain/entities/cep_entity.dart';

abstract class CepRepository {
  Future<Either<Failure, CepEntity>> getCep(String cep);
}
