import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_example/domain/usecases/get_cep_usecase.dart';
import 'package:flutter_modular_example/presentation/features/search_cep/cubit/cep_state.dart';

class CepCubit extends Cubit<CepState> {
  final GetCepUseCase _getCepUseCase;

  CepCubit(this._getCepUseCase) : super(CepInitial());

  void getCep(String cep) async {
    emit(CepLoading());
    final failureOrSucess = await _getCepUseCase(cep);
    emit(failureOrSucess.fold(
      (failure) => CepError(failure.toString()),
      (cepModel) => CepLoaded(cepModel),
    ));
  }
}
