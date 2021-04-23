import 'dart:convert';

class UserModel {
  final String name;
  final String urlPhoto;
  final int score;
  
  UserModel({
    required this.name,
    required this.urlPhoto,
    this.score = 0,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'urlPhoto': urlPhoto,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      urlPhoto: map['urlPhoto'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
