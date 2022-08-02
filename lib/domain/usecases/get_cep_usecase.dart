import 'package:dartz/dartz.dart';
import 'package:get_cep_clean_arch/core/errors/failures.dart';
import 'package:get_cep_clean_arch/core/usecases/usecase.dart';
import 'package:get_cep_clean_arch/domain/entities/cep_entity.dart';
import 'package:get_cep_clean_arch/domain/repositories/cep_repository.dart';

class GetCepUseCase implements Usecase<CepEntity, String> {
  GetCepUseCase(this.repository);

  final CepRepository repository; //Injecting the repository

  @override
  Future<Either<Failure, CepEntity>> call(String cep) async {
    return await repository.getCep(cep);
  }
}
