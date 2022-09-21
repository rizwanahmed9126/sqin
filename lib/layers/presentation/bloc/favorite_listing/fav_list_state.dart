part of 'fav_list_bloc.dart';

///Bloc Abstract Season State which lets you create events on behalf of it.
@immutable
abstract class FavoriteListState {
  ///Constructor
  const FavoriteListState();
}
///State that fires for  the first time
class FavInitialState extends FavoriteListState {}
///State  that lets you know when something is loading
class FavListEmptyState extends FavoriteListState {}
///State that informs you that all season data has been loaded
class FavListLoadedState extends FavoriteListState {
  ///Constructor that takes a list of seasons
  const FavListLoadedState({required this.favoriteList});
  ///Property
  final List<AllSeriesModel> favoriteList;
}


class toggleFav extends FavoriteListState {
  ///Constructor that takes a list of seasons
  const toggleFav({required this.isFavorite});
  ///Property
  final bool isFavorite;
}
///State that is fired if an error occurs
class FavListErrorState extends FavoriteListState {}
class FavAddedState extends FavoriteListState {}
class FavFailedState extends FavoriteListState {}
