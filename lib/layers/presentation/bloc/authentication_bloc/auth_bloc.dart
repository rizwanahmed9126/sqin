import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sqin_task/layers/domain/usecases/authentication_tasks.dart';
import 'package:sqin_task/layers/presentation/routes.dart';
import '../../../data/services/storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

///Bloc for managing Episode states
class AuthBloc extends Cubit<AuthState> {
  final AuthenticationTasks _authenticationTasks;

  ///Constructor.Parameter showService is required.
  AuthBloc(this._authenticationTasks) : super(ShowInitialState());


  var storageService = StorageService();



  void login(context,String email,String pass)async{

    emit(LoadingState());

    final result = await _authenticationTasks.login(email,pass);

    result.fold((e) {emit(ErrorState());}, (list) {
      if(list){
        Navigator.pushNamed(context, homeScreenRoute);
         storageService.setBoolData('isShowHome', true);


      }
      emit(CompletedState());

    });

  }
  void signUP(context,String email,String pass)async{

    emit(LoadingState());

    final result = await _authenticationTasks.signUp(email,pass);

    result.fold((e) {emit(ErrorState());}, (list) {
      if(list){
        Navigator.pushNamed(context, homeScreenRoute);
        storageService.setBoolData('isShowHome', true);


      }
      emit(CompletedState());

    });

  }
  void fingerPrint(context)async{

    emit(LoadingState());

    final result = await _authenticationTasks.fingerPrint();

    result.fold((e) {emit(ErrorState());}, (list) {
      if(list){
        Navigator.pushNamed(context, homeScreenRoute);
        storageService.setBoolData('isShowHome', true);


      }
      emit(CompletedState());

    });

  }



}
