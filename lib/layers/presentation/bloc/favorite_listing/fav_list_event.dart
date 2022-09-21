part of 'fav_list_bloc.dart';

///Season abstract class that lets you create new events for a season
abstract class FavoriteListEvent extends Equatable {
  ///constructor
  const FavoriteListEvent();

  @override
  List<Object> get props => <Object>[];
}

///Event that loads all seasons for a show
class LoadFavEvent extends FavoriteListEvent {
  ///constructor that takes a show Id
  const LoadFavEvent(this.showId);
  ///Parameter show Id
  final int showId;

  @override
  List<Object> get props => <Object>[];
}

///Season event to clear all of the result.
class ClearFavEvent extends FavoriteListEvent {
  @override
  List<Object> get props => <Object>[];
}
