import 'package:get_cep_clean_arch/domain/entities/github_user_entity.dart';

class GithubModel extends GithubEntity {
  const GithubModel({
    required int id,
    required String avatarUrl,
    required String type,
    required String name,
    required String company,
    required String location,
    required String bio,
    required int followers,
    required int following,
    required int publicRepos,
  }) : super(
          id: id,
          avatarUrl: avatarUrl,
          type: type,
          name: name,
          company: company,
          location: location,
          bio: bio,
          followers: followers,
          following: following,
          publicRepos: publicRepos,
        );

  factory GithubModel.fromJson(Map<String, dynamic> json) => GithubModel(
        id: json['id'],
        avatarUrl: json['avatar_url'],
        type: json['type'],
        name: json['name'],
        company: json['company'],
        location: json['location'],
        bio: json['bio'],
        publicRepos: json['public_repos'],
        followers: json['followers'],
        following: json['following'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    data['type'] = type;
    data['name'] = name;
    data['company'] = company;
    data['location'] = location;
    data['bio'] = bio;
    data['public_repos'] = publicRepos;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}
