import 'picture.dart';

class FaceBookModel {
  String? name;
  String? email;
  Picture? picture;
  String? id;

  FaceBookModel({this.name, this.email, this.picture, this.id});

  factory FaceBookModel.fromJson(Map<String, dynamic> json) => FaceBookModel(
        name: json['name'] as String?,
        email: json['email'] as String?,
        picture: json['picture'] == null
            ? null
            : Picture.fromJson(json['picture'] as Map<String, dynamic>),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'picture': picture?.toJson(),
        'id': id,
      };
}
