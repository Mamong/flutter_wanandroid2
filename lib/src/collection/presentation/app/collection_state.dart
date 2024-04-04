part of 'collection_provider.dart';


abstract class CollectionState extends Equatable{
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
  const CollectionFetched();
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

class CollectionError extends CollectionState {
  const CollectionError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}