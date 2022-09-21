import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';

import '../../../domain/usecases/get_todo_tasks.dart';

part 'show_event.dart';
part 'show_state.dart';

///Bloc for managing Episode states
class ShowBloc extends Cubit<ShowState> {
  final GetTodoTasks _getCurrentWeather;

  ///Constructor.Parameter showService is required.
  ShowBloc(this._getCurrentWeather) : super(ShowInitialState());

   int currentPage=0;


  pagination(){
    currentPage++;
    showListing();
  }


  void showListing()async{
    // if(currentPage==0){
    //   emit(ShowLoadingState());
    //
    // }
    if(state is ShowLoadingState) return;

    final currentState=state;
    
    var oldposts=<AllSeriesModel>[];
    
    if(currentState is ShowListLoadedState){
      oldposts=currentState.showList;
    }
    
    emit(ShowLoadingState(showList: oldposts,isFirstFetch: currentPage==0));


    final result = await _getCurrentWeather.execute(currentPage);




     result.fold((e) {
      emit(ShowErrorState());
    }, (list) {
      currentPage++;

      final posts=(state as ShowLoadingState).showList;
      posts.addAll(list);

      emit(ShowListLoadedState(showList: posts));

    },
    );

  }


}
