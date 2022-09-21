import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';

import '../../../domain/usecases/local/get_favorite_task.dart';
import '../favorite_listing/fav_list_bloc.dart';
import 'fav_bloc.dart';


part 'fav_event.dart';
part 'fav_state.dart';

///Season Bloc that handles the events



class FavoriteBloc extends Cubit<FavoriteState> {
  final GetFavoriteTask _getFavoriteTask;

  ///Constructor.Parameter showService is required.
  FavoriteBloc(this._getFavoriteTask) : super(FavInitialState());





  Future<bool> isSeriesFavorite(String id)async{
    final result = await _getFavoriteTask.isSeriesFav(id);

    emit(IsFav(value: result));


    return result;

  }

  void saveFavorite(context,String id)async{

    final result = await _getFavoriteTask.save(id);

    result.fold((e) {
      emit(FavFailedState());

    }, (list) {
      BlocProvider.of<FavoriteListBloc>(context).showListing();

      emit(IsFav(value: true));

    });

  }

  void removeFavorite(context,String id)async{

    final result = await _getFavoriteTask.delete(id);

    result.fold((e) {
      emit(FavFailedState());

    }, (list) {


      if(list) {
        BlocProvider.of<FavoriteListBloc>(context).showListing();

        // showListing(false);
        emit(IsFav(value: false));
      }


    });

  }




}


