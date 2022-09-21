part of 'auth_bloc.dart';
///Abstract class Show Event. Allows you to create events on behalf of it to use
/// it in the bloc.
@immutable
abstract class AuthEvent extends Equatable {}
///Episode Event: Loads Shows available
class LoadShowDataEvent extends AuthEvent {



  @override
  List<Object?> get props => <Object>[];
}

///Event  that happens when 

