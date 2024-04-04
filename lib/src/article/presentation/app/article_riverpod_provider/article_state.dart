
part of 'article_provider.dart';

abstract class ArticleState extends Equatable{
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState{
  const ArticleInitial();
}

class ArticleLoading extends ArticleState{
  const ArticleLoading();
}

class ArticleFetched extends ArticleState{
  const ArticleFetched(this.articles);

  final List<Article> articles;

  @override
  List<Object> get props => [articles];
}

class ArticleError extends ArticleState {
  const ArticleError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}