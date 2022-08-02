import 'package:dartz/dartz.dart';
import 'package:get_cep_clean_arch/core/errors/failures.dart';
import 'package:get_cep_clean_arch/domain/entities/cep_entity.dart';

abstract class CepRepository {
  Future<Either<Failure, CepEntity>> getCep(String cep);
}
