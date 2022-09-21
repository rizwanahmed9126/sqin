


import 'package:dartz/dartz.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';
import 'package:sqin_task/layers/domain/repositories/local_repository.dart';

import '../../../../commons/failure.dart';

class GetFavoriteTask {
  final LocalDataRepository _localDataRepository;

  GetFavoriteTask(this._localDataRepository);

  Future<Either<Failure, List<AllSeriesModel>>> get() {
    return _localDataRepository.getAllFavorite();
  }
  Future<Either<Failure, bool>> save(String id) {
    return _localDataRepository.saveAllFavorite(id);
  }
  Future<Either<Failure, bool>> delete(String id) {
    return _localDataRepository.deleteAllFavorite(id);
  }

  Future<bool> isSeriesFav(String id) {
    return _localDataRepository.checkIsSeriesIsFav(id);
  }

}