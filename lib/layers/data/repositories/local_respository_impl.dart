import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:sqin_task/layers/data/datasources/local_data_source.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';
import 'package:sqin_task/layers/data/models/get_episodes/episodes_data_model.dart';
import 'package:sqin_task/layers/data/models/seasons_details/seasons_details_model.dart';
import 'package:sqin_task/layers/domain/repositories/local_repository.dart';
import '../../../commons/exception.dart';
import '../../../commons/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/remote_data_source.dart';

class LocalRepositoryImpl implements LocalDataRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  LocalRepositoryImpl( {required this.localDataSource,required this.remoteDataSource});



  @override
  Future<Either<Failure, List<AllSeriesModel>>> getAllFavorite() async {
    try {
      final result = await localDataSource.fetchList(key: 'favoriteList');
      //final favoriteSeriesIds = await fetchAllFavoriteSeriesIdsUseCase.call();

      if (result.isEmpty) {
        return const Right([]);
      }

      final favoriteSeriesList = <AllSeriesModel>[];
      //final RemoteDataSource remoteDataSource=RemoteDataSource();

      for (var id in result) {
        final result = await remoteDataSource.getSeriesById(int.parse(id));

        favoriteSeriesList.add(result);
      }


      return Right(favoriteSeriesList);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<bool> checkIsSeriesIsFav(String id) async {
    try {
      final result = await localDataSource.fetchList(key: 'favoriteList');

      if (result.contains(id)) {

        return true;
      }




      return false;
    } on ServerException {
      return  false;
    } on SocketException {
      return false;
    }
  }


  @override
  Future<Either<Failure, bool>> deleteAllFavorite(String id) async {
    try {
      String key= 'favoriteList';
      final currentList = await localDataSource.fetchList(key: key);

      currentList.removeWhere((element) => element == id);


      final result = await localDataSource.saveList(key: key, value: currentList);
      return const Right(true);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }


  @override
  Future<Either<Failure, bool>> saveAllFavorite(String id)async {
    try {
     String key= 'favoriteList';
      final currentList = await localDataSource.fetchList(key: key);

      if (!currentList.contains(id)) {
        currentList.add(id);
      }

      final result = await localDataSource.saveList(key: key, value: currentList);
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }


}
