import 'package:flutter_modular_example/data/models/cep_model.dart';

abstract class CepDatasource {
  Future<CEPModel> getCep(String cep);
}
