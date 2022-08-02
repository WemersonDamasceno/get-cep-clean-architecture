import 'package:get_cep_clean_arch/data/datasources/api_constants/api_constants.dart';

class ViaCepConstantsImp implements ApiConstants {
  @override
  String baseUrl(cep) {
    return "https://viacep.com.br/ws/$cep/json/";
  }
}
