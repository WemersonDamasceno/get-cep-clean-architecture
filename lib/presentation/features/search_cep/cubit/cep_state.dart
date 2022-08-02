import 'package:equatable/equatable.dart';
import 'package:get_cep_clean_arch/domain/entities/cep_entity.dart';

class CepState extends Equatable {
  const CepState();

  @override
  List<Object?> get props => [];
}

class CepInitial extends CepState {}

class CepLoading extends CepState {}

class CepLoaded extends CepState {
  final CepEntity cepResponse;

  const CepLoaded(this.cepResponse);

  @override
  List<Object?> get props => [cepResponse];
}

class CepError extends CepState {
  final String error;

  const CepError(this.error);

  @override
  List<Object?> get props => [error];
}
