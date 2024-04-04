import 'package:flutter_wanandroid2/src/home/domain/entities/banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable(createToJson: false)
class BannerModel {
  final String desc;
  final int id;
  final String imagePath;
  final int isVisible;
  final int order;
  final String title;
  final int type;
  final String url;

  const BannerModel(
      {required this.desc,
      required this.id,
      required this.imagePath,
      required this.isVisible,
      required this.order,
      required this.title,
      required this.type,
      required this.url});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

extension BannerModeltoDomain on BannerModel {
  Banner toDomainModel() {
    return Banner(
        desc: desc,
        id: id,
        imagePath: imagePath,
        title: title,
        type: type,
        url: url);
  }
}
