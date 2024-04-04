import 'package:flutter_wanandroid2/src/article/domain/entities/paginated_resp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_resp_model.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PaginatedRespModel<T> {
  final int curPage;

  final List<T> datas;

  final int offset;
  final bool over;
  final int pageCount;
  final int size;
  final int total;

  PaginatedRespModel(
      {required this.curPage,
      required this.datas,
      required this.offset,
      required this.over,
      required this.pageCount,
      required this.size,
      required this.total});

  bool get hasMore => curPage < pageCount;

  factory PaginatedRespModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedRespModelFromJson(json, fromJsonT);
}

extension PaginatedRespModeltoDomain on PaginatedRespModel {
  PaginatedResp<S> toDomainModel<S,T>(S Function(T json) toDomainModel) {
    return PaginatedResp(
      curPage: curPage,
      offset: offset,
      total: total,
      datas: (datas as List<T>).map(toDomainModel).toList(),
      over: over,
      pageCount: pageCount,
      size: size,
    );
  }
}
