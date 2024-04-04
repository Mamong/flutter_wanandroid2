import 'package:flutter/material.dart';

class ThemeColor {
  final String name;
  final int color;
  final ThemeMode theme;

  const ThemeColor(
      {required this.name, required this.color, required this.theme});
}

const themeColors = [
  ThemeColor(name: '默认主题色', color: 0xFF2196F3, theme: ThemeMode.light),
  ThemeColor(name: '皇家蓝', color: 0xFF4169E1, theme: ThemeMode.light),
  ThemeColor(name: '军校蓝', color: 0xFF5F9EA0, theme: ThemeMode.light),
  ThemeColor(name: '深卡其布', color: 0xFFBDB76B, theme: ThemeMode.light),
  ThemeColor(name: '玫瑰棕色', color: 0xFFBC8F8F, theme: ThemeMode.light),
  ThemeColor(name: '印度红', color: 0xFFCD5C5C, theme: ThemeMode.light),
  ThemeColor(name: '深石板灰', color: 0xFF2F4F4F, theme: ThemeMode.light),
  ThemeColor(name: '海洋绿', color: 0xFF2E8B57, theme: ThemeMode.light),
  ThemeColor(name: '暗淡的灰色', color: 0xFF696969, theme: ThemeMode.light),
  ThemeColor(name: '橙色', color: 0xFFFFA500, theme: ThemeMode.light),
  ThemeColor(name: '粉红色', color: 0xFFFFC0CB, theme: ThemeMode.light),
  ThemeColor(name: '深粉色', color: 0xFFFF1493, theme: ThemeMode.light),
  ThemeColor(name: '兰花的紫色', color: 0xFFDA70D6, theme: ThemeMode.light),
  ThemeColor(name: '适中的紫色', color: 0xFF9370DB, theme: ThemeMode.light),
  ThemeColor(name: '紫色', color: 0xFF800080, theme: ThemeMode.light),
  ThemeColor(name: '纯黑', color: 0xFF000000, theme: ThemeMode.dark),
];