import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular_example/core/errors/failures.dart';

abstract class Usecase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams noParams);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
