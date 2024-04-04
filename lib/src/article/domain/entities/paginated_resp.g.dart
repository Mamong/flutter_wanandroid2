// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResp<T> _$PaginatedRespFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResp<T>(
      curPage: json['curPage'] as int,
      datas: (json['datas'] as List<dynamic>).map(fromJsonT).toList(),
      offset: json['offset'] as int,
      over: json['over'] as bool,
      pageCount: json['pageCount'] as int,
      size: json['size'] as int,
      total: json['total'] as int,
    );
