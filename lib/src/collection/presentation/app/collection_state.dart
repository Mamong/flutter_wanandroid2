part of 'collection_provider.dart';

abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitial extends CollectionState {
  const CollectionInitial();
}

class CollectionLoading extends CollectionState {
  const CollectionLoading();
}

class CollectionFetched extends CollectionState {
  const CollectionFetched({required this.list, this.hasMore = true});

  final List<Article> list;
  final bool hasMore;

  @override
  List<Object> get props => [list, hasMore];
}

class AddingToCollection extends CollectionState {
  const AddingToCollection();
}

class AddedToCollection extends CollectionState {
  const AddedToCollection();
}

class RemovingFromCollection extends CollectionState {
  const RemovingFromCollection();
}

class RemovedFromCollection extends CollectionState {
  const RemovedFromCollection();
}

class RemovedFromMyCollection extends CollectionState {
  const RemovedFromMyCollection(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class CollectionError extends CollectionState {
  const CollectionError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
