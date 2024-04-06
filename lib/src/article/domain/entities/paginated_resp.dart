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
}
