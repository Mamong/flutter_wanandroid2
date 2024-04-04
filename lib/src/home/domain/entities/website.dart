import 'package:json_annotation/json_annotation.dart';

part 'website.g.dart';

@JsonSerializable(createToJson: false)
class Website{
  final String category;
  final String icon;
  final int id;
  final String link;
  final String name;

  const Website({
    required this.category,
    required this.icon,
    required this.id,
    required this.link,
    required this.name});

  factory Website.fromJson(Map<String, dynamic> json) =>
      _$WebsiteFromJson(json);
}