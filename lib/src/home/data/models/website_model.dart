import 'package:flutter_wanandroid2/src/home/domain/entities/website.dart';
import 'package:json_annotation/json_annotation.dart';

part 'website_model.g.dart';

@JsonSerializable(createToJson: false)
class WebsiteModel{
  final String category;
  final String icon;
  final int id;
  final String link;
  final String name;
  final int order;
  final int visible;

  const WebsiteModel({
    required this.category,
    required this.icon,
    required this.id,
    required this.link,
    required this.name,
    required this.order,
    required this.visible});

  factory WebsiteModel.fromJson(Map<String, dynamic> json) =>
      _$WebsiteModelFromJson(json);
}

extension WebsiteModeltoDomain on WebsiteModel {
  Website toDomainModel() {
    return Website(
      category: category,
      icon: icon,
      id: id,
      link: link,
      name: name,
    );
  }
}