// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      desc: json['desc'] as String,
      id: (json['id'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      isVisible: (json['isVisible'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      title: json['title'] as String,
      type: (json['type'] as num).toInt(),
      url: json['url'] as String,
    );
