import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';
import 'package:sqin_task/layers/data/models/get_all_people/get_all_people_model.dart';
import 'package:sqin_task/layers/domain/usecases/get_people_task.dart';


part 'people_event.dart';
part 'people_state.dart';

///Bloc for managing Episode states
class PeopleBloc extends Cubit<PeopleState> {
  final GetPeople _getPeople;

  ///Constructor.Parameter showService is required.
  PeopleBloc(this._getPeople) : super(PeopleInitialState());






  void showListing()async{

    final result = await _getPeople.execute();

    result.fold((e) {
      emit(ErrorState());
    }, (list) {

      emit(LoadedState(showList: list));

    },
    );

  }



}
