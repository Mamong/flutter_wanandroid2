// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedRespModel<T> _$PaginatedRespModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedRespModel<T>(
      curPage: (json['curPage'] as num).toInt(),
      datas: (json['datas'] as List<dynamic>).map(fromJsonT).toList(),
      offset: (json['offset'] as num).toInt(),
      over: json['over'] as bool,
      pageCount: (json['pageCount'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );
