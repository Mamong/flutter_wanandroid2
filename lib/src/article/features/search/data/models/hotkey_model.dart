import 'package:flutter_wanandroid2/src/article/features/search/domain/entities/hotkey.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotkey_model.g.dart';

@JsonSerializable(createToJson: false)
class HotkeyModel {
  final int id;
  final String link;
  final String name;
  final int order;
  final int visible;

  const HotkeyModel(
      {required this.id,
      required this.link,
      required this.name,
      required this.order,
      required this.visible});

  factory HotkeyModel.fromJson(Map<String, dynamic> json) =>
      _$HotkeyModelFromJson(json);
}

extension HotkeyModeltoDomain on HotkeyModel {
  Hotkey toDomainModel({bool isTop = false}) {
    return Hotkey(id: id, link: link, name: name);
  }
}
