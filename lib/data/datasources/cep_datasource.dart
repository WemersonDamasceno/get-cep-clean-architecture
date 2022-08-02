import 'package:get_cep_clean_arch/data/models/cep_model.dart';

abstract class CepDatasource {
  Future<CEPModel> getCep(String cep);
}
