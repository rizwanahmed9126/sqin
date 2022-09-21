part of 'people_bloc.dart';

///Abstract class 'ShowState' which lets create states for a show. Extend from
/// this class to create a State.
@immutable
abstract class PeopleState {}

///State that shows initial state
class PeopleInitialState extends PeopleState {}
///State that refers a show is being loaded
class LoadingState extends PeopleState {
  LoadingState({required this.showList, this.isFirstFetch=false});
  ///Porperty list of  shows
  final List<PeopleModel> showList;
  final bool isFirstFetch;

}
///State that lets you know a list of Shows have loaded
class LoadedState extends PeopleState {
  ///Constructor that takes a list of shows.
  LoadedState({required this.showList});
  ///Porperty list of  shows
  final List<PeopleModel> showList;

}


///State  that lets you know an error occurred.
class ErrorState extends PeopleState {}
