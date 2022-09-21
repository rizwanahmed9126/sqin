part of 'people_bloc.dart';
///Abstract class Show Event. Allows you to create events on behalf of it to use
/// it in the bloc.
@immutable
abstract class PeopleEvent extends Equatable {}
///Episode Event: Loads Shows available
class LoadShowDataEvent extends PeopleEvent {



  @override
  List<Object?> get props => <Object>[];
}
