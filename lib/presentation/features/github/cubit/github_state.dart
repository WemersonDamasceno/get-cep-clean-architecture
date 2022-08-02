part of 'github_cubit.dart';

abstract class GithubState extends Equatable {
  const GithubState();

  @override
  List<Object> get props => [];
}

class GithubInitial extends GithubState {}

class GithubLoading extends GithubState {}

class GithubLoaded extends GithubState {
  final GithubEntity githubEntity;

  const GithubLoaded({required this.githubEntity});

  @override
  List<Object> get props => [githubEntity];
}

class GithubError extends GithubState {
  final String error;

  const GithubError(this.error);

  @override
  List<Object> get props => [error];
}
