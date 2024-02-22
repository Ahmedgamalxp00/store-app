import 'data.dart';

class Picture {
  Data? data;

  Picture({this.data});

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
