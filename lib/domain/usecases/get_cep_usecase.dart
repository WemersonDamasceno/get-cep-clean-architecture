import 'package:dartz/dartz.dart';
import 'package:flutter_modular_example/core/errors/failures.dart';
import 'package:flutter_modular_example/core/usecases/usecase.dart';
import 'package:flutter_modular_example/domain/entities/cep_entity.dart';
import 'package:flutter_modular_example/domain/repositories/cep_repository.dart';

class GetCepUseCase implements Usecase<CepEntity, String> {
  GetCepUseCase(this.repository);

  final CepRepository repository; //Injecting the repository

  @override
  Future<Either<Failure, CepEntity>> call(String cep) async {
    return await repository.getCep(cep);
  }
}
