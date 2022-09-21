part of 'auth_bloc.dart';

///Abstract class 'ShowState' which lets create states for a show. Extend from
/// this class to create a State.
@immutable
abstract class AuthState {}

///State that shows initial state
class ShowInitialState extends AuthState {}
///State that refers a show is being loaded


///State  that lets you know an error occurred.
class ErrorState extends AuthState {}
class LoadingState extends AuthState {}
class CompletedState extends AuthState {}
