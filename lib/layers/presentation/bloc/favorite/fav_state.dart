part of 'fav_bloc.dart';

///Bloc Abstract Season State which lets you create events on behalf of it.
@immutable
abstract class FavoriteState {
  ///Constructor
  const FavoriteState();
}
///State that fires for  the first time
class FavInitialState extends FavoriteState {}
///State  that lets you know when something is loading
class FavLoadingState extends FavoriteState {}
///State that informs you that all season data has been loaded
class FavLoadedState extends FavoriteState {
  ///Constructor that takes a list of seasons
  const FavLoadedState({required this.favoriteList});
  ///Property
  final List<AllSeriesModel> favoriteList;
}


class IsFav extends FavoriteState {
  ///Constructor that takes a list of seasons
  const IsFav({ this.value=false});
  ///Property
  final bool value;
}

class toggleFav extends FavoriteState {
  ///Constructor that takes a list of seasons
  const toggleFav({required this.isFavorite});
  ///Property
  final bool isFavorite;
}
///State that is fired if an error occurs
class FavErrorState extends FavoriteState {}
class FavAddedState extends FavoriteState {}
class FavFailedState extends FavoriteState {}
