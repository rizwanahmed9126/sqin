import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';
import 'package:sqin_task/layers/data/models/seasons_details/seasons_details_model.dart';
import 'package:sqin_task/layers/domain/usecases/get_seasons_task.dart';

import '../../../domain/usecases/local/get_favorite_task.dart';
import 'fav_list_bloc.dart';


part 'fav_list_event.dart';
part 'fav_list_state.dart';

///Season Bloc that handles the events



class FavoriteListBloc extends Cubit<FavoriteListState> {
  final GetFavoriteTask _getFavoriteTask;

  ///Constructor.Parameter showService is required.
  FavoriteListBloc(this._getFavoriteTask) : super(FavInitialState());






  void showListing()async{

    final result = await _getFavoriteTask.get();

    result.fold((e) {
      emit(FavListErrorState());
    }, (list) {
      if(list.isNotEmpty){
        emit(FavListLoadedState(favoriteList: list));

      }
      else{
        emit(FavListEmptyState());

      }




    });

  }





}


