import 'package:get_cep_clean_arch/domain/entities/cep_entity.dart';

class CEPModel extends CepEntity {
  const CEPModel({
    required String cep,
    required String logradouro,
    required String complemento,
    required String bairro,
    required String localidade,
    required String uf,
    required String ibge,
    required String gia,
    required String ddd,
    required String siafi,
  }) : super(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
          ibge: ibge,
          gia: gia,
          ddd: ddd,
          siafi: siafi,
        );

  factory CEPModel.fromJson(Map<String, dynamic> json) => CEPModel(
        cep: json['cep'] as String,
        logradouro: json['logradouro'] as String,
        complemento: json['complemento'] as String,
        bairro: json['bairro'] as String,
        localidade: json['localidade'] as String,
        uf: json['uf'] as String,
        ibge: json['ibge'] as String,
        gia: json['gia'] as String,
        ddd: json['ddd'] as String,
        siafi: json['siafi'] as String,
      );

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'logradouro': logradouro,
        'complemento': complemento,
        'bairro': bairro,
        'localidade': localidade,
        'uf': uf,
        'ibge': ibge,
        'gia': gia,
        'ddd': ddd,
        'siafi': siafi,
      };
}
