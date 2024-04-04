import 'package:json_annotation/json_annotation.dart';

part 'paginated_resp.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PaginatedResp<T> {
  final int curPage;

  final List<T> datas;

  final int offset;
  final bool over;
  final int pageCount;
  final int size;
  final int total;

  PaginatedResp(
      {required this.curPage,
        required this.datas,
        required this.offset,
        required this.over,
        required this.pageCount,
        required this.size,
        required this.total});

  bool get hasMore => curPage < pageCount;

  factory PaginatedResp.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PaginatedRespFromJson(json, fromJsonT);
}