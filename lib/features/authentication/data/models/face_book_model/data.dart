class Data {
  int? height;
  String? url;
  int? width;

  Data({this.height, this.url, this.width});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        height: json['height'] as int?,
        url: json['url'] as String?,
        width: json['width'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'url': url,
        'width': width,
      };
}
