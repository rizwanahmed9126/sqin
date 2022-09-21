

import 'package:dartz/dartz.dart';

import '../../../commons/failure.dart';
import '../../data/models/get_all_series/all_series_model.dart';

abstract class LocalDataRepository {
  Future<Either<Failure, List<AllSeriesModel>>> getAllFavorite();
  Future<Either<Failure, bool>> deleteAllFavorite(String id);
  Future<Either<Failure, bool>> saveAllFavorite(String id);
  Future<bool> checkIsSeriesIsFav(String key);




}