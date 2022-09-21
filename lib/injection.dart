import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:sqin_task/layers/data/datasources/local_data_source.dart';
import 'package:sqin_task/layers/data/repositories/local_respository_impl.dart';
import 'package:sqin_task/layers/domain/usecases/authentication_tasks.dart';
import 'package:sqin_task/layers/domain/usecases/get_episodes_task.dart';
import 'package:sqin_task/layers/domain/usecases/get_people_task.dart';
import 'package:sqin_task/layers/domain/usecases/get_seasons_task.dart';
import 'package:sqin_task/layers/domain/usecases/local/get_favorite_task.dart';
import 'package:sqin_task/layers/presentation/bloc/authentication_bloc/auth_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/favorite/fav_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/season/season_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/show/show_bloc.dart';

import 'layers/data/datasources/remote_data_source.dart';
import 'layers/data/repositories/todo_repository_impl.dart';
import 'layers/data/services/storage.dart';
import 'layers/domain/repositories/local_repository.dart';
import 'layers/domain/repositories/todo_repository.dart';
import 'layers/domain/usecases/get_todo_tasks.dart';
import 'layers/presentation/bloc/favorite_listing/fav_list_bloc.dart';
import 'layers/presentation/bloc/people_bloc/people_bloc.dart';

final locator = GetIt.instance;

void init() {


  locator.registerFactory(() => ShowBloc(locator()));
  locator.registerFactory(() => SeasonBloc(locator()));
  locator.registerFactory(() => FavoriteBloc(locator()));
  locator.registerFactory(() => PeopleBloc(locator()));
  locator.registerFactory(() => FavoriteListBloc(locator()));
  locator.registerFactory(() => AuthBloc(locator()));


  // usecase
  locator.registerLazySingleton(() => GetTodoTasks(locator()));
  locator.registerLazySingleton(() => GetEpisodesTasks(locator()));
  locator.registerLazySingleton(() => GetSeasonsTasks(locator()));
  locator.registerLazySingleton(() => GetFavoriteTask(locator()));
  locator.registerLazySingleton(() => GetPeople(locator()));
  locator.registerLazySingleton(() => AuthenticationTasks(locator()));

  // repository
  locator.registerLazySingleton<TodoRepository>(() =>TodoRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<LocalDataRepository>(() =>LocalRepositoryImpl(remoteDataSource: locator(),localDataSource: locator()));

  // data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: locator(),),);
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(),);

  //storage
  locator.registerLazySingleton<StorageService>(() => StorageService(),);




  // external
  locator.registerLazySingleton(() => http.Client());
}
