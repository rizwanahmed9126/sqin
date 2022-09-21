part of 'show_bloc.dart';

///Abstract class 'ShowState' which lets create states for a show. Extend from
/// this class to create a State.
@immutable
abstract class ShowState {}

///State that shows initial state
class ShowInitialState extends ShowState {}
///State that refers a show is being loaded
class ShowLoadingState extends ShowState {
  ShowLoadingState({required this.showList, this.isFirstFetch=false});
  ///Porperty list of  shows
  final List<AllSeriesModel> showList;
  final bool isFirstFetch;

}
///State that lets you know a list of Shows have loaded
class ShowListLoadedState extends ShowState {
  ///Constructor that takes a list of shows.
  ShowListLoadedState({required this.showList});
  ///Porperty list of  shows
  final List<AllSeriesModel> showList;

}

///State that lets you know a Show has loaded
class ShowLoadedState extends ShowState {
  ///Constructor that takes a show as parameter
  ShowLoadedState({required this.show});
  ///Property 
  final AllSeriesModel show;

}

///State  that lets you know an error occurred.
class ShowErrorState extends ShowState {}
