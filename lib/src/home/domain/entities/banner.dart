
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable(createToJson: false)
class Banner {
  final String desc;
  final int id;
  final String imagePath;
  final String title;
  final int type;
  final String url;

  const Banner({
    required this.desc,
    required this.id,
    required this.imagePath,
    required this.title,
    required this.type,
    required this.url});

  factory Banner.fromJson(Map<String, dynamic> json) =>
      _$BannerFromJson(json);
}