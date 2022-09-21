import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqin_task/layers/data/models/seasons_details/seasons_details_model.dart';
import 'package:sqin_task/layers/domain/usecases/get_seasons_task.dart';

import '../../../domain/usecases/local/get_favorite_task.dart';


part 'season_event.dart';
part 'season_state.dart';

///Season Bloc that handles the events


class SeasonBloc extends Cubit<SeasonState> {
  final GetSeasonsTasks _getCurrentWeather;


  ///Constructor.Parameter showService is required.
  SeasonBloc(this._getCurrentWeather) : super(SeasonInitialState());









  void showListing(int id)async{


    final result = await _getCurrentWeather.execute(id);




    result.fold((e) {
      emit(SeasonErrorState());
    }, (list) {
      emit(SeasonLoadedState(seasonList: list));

    },
    );

  }




}

