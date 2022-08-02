import 'package:equatable/equatable.dart';

class GithubEntity extends Equatable {
  final int id;
  final String avatarUrl;
  final String type;
  final String name;
  final String company;
  final String location;
  final String bio;
  final int followers;
  final int following;
  final int publicRepos;

  const GithubEntity({
    required this.publicRepos,
    required this.id,
    required this.avatarUrl,
    required this.type,
    required this.name,
    required this.company,
    required this.location,
    required this.bio,
    required this.followers,
    required this.following,
  });

  @override
  List<Object?> get props => [];
}
