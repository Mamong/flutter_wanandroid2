part of 'article_list.dart';

class ArticleListItem extends ConsumerWidget {
  const ArticleListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (source, ext) = ref.read(articleSourceProvider);

    final index = ref.read(indexProvider);
    final article = ref
        .watch(ArticleAdapterProvider(source, ext))
        .requireValue
        .datas[index];
    return ArticleItem(
      article: article,
    );
  }
}

class ArticleItem extends ConsumerWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (source, _) = ref.read(articleSourceProvider);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Ink(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.w)),
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
                onTap: () {
                  context.push(Uri(path: "/webview", queryParameters: {
                    'title': article.title,
                    'url': article.link
                  }).toString());
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.w, 25.w, 20.w, 13.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //title
                          ArticleTitle(
                              title: article.title, isTop: article.isTop),
                          //desc
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.w),
                            child: Text(article.desc,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(color: Color(0xff666666))),
                          ),
                          //bottom
                          ArticleBottom(
                              id: article.id,
                              originId: article.originId,
                              date: article.niceDate,
                              author: article.displayAuthor)
                        ],
                      )),
                      Gap(16.w),
                      article.envelopePic.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: article.envelopePic,
                              height: 200.w,
                              width: 120.w,
                              fit: BoxFit.cover,
                              //placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(60.w), // 设置圆角半径为10
                              child: Container(
                                width: 120.w,
                                height: 120.w,
                                color: source == ArticleSource.wxarticle
                                    ? Colours.WX_GREEN
                                    : Constants.chapterBgColor[article.id % 10],
                                child: Center(
                                  child: Text(
                                    article.superChapterName,
                                    style: TextStyle(
                                      height: 1.1,
                                      color: Colors.white,
                                      fontSize: 20.0.w,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ))));
  }
}

class ArticleTitle extends StatelessWidget {
  const ArticleTitle({super.key, required this.title, this.isTop = false});

  final String title;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          if (isTop) ...[
            WidgetSpan(
                baseline: TextBaseline.alphabetic,
                alignment: PlaceholderAlignment.baseline,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "置顶",
                    style: TextStyle(
                        fontSize: 26.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            const TextSpan(text: " ")
          ],
          TextSpan(
            ///TODO: deal with html tag and content escape
            text: title
                .replaceAll("<em class='highlight'>", "【")
                .replaceAll("</em>", "】"),
            style: TextStyle(
                fontSize: 26.w,
                fontWeight: FontWeight.bold,
                color: const Color(0xff222222)),
          ),
        ]));
  }
}

class ArticleBottom extends StatelessWidget {
  const ArticleBottom(
      {super.key,
      required this.id,
      this.originId,
      required this.date,
      required this.author});

  final int id;
  final int? originId;
  final String date;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CollectionIcon(id: id, originId: originId),
        IconButton(
            style: ButtonStyles.shrinkIconButton(const Size(30, 30)),
            onPressed: null,
            icon: Icon(
              Icons.access_time_filled,
              size: 50.w,
              color: const Color(0xFFE0E0E0),
            )),
        Text(
          date,
          style: TextStyle(fontSize: 24.w, color: const Color(0xFF999999)),
        ),
        Gap(20.w),
        Expanded(
            child: Text(
          author,
          style: TextStyle(
              fontSize: 24.w,
              color: const Color(0xFF999999),
              overflow: TextOverflow.ellipsis),
        )),
      ],
    );
  }
}
