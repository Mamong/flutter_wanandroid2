part of 'collection_list.dart';

class CollectionListItem extends StatelessWidget {
  const CollectionListItem({super.key, required this.collection});

  final CollectionInfo collection;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Ink(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.w)),
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
                onTap: () {
                  context.push(Uri(path: "/webview", queryParameters: {
                    'title': collection.title,
                    'url': collection.link
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
                          ArticleTitle(title: collection.title),
                          //desc
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.w),
                            child: Text(collection.desc,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    const TextStyle(color: Color(0xff666666))),
                          ),
                          //bottom
                          ArticleBottom(
                              id: collection.id,
                              originId: collection.originId,
                              date: collection.niceDate,
                              author: collection.author)
                        ],
                      )),
                      Gap(16.w),
                      collection.envelopePic.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: collection.envelopePic,
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
                                color: Constants
                                    .chapterBgColor[collection.id % 10],
                                child: Center(
                                  child: Text(
                                    "文章",
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
