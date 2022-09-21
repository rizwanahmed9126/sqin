import 'package:dartz/dartz.dart';
import 'package:sqin_task/layers/data/models/get_all_people/get_all_people_model.dart';
import '../../../commons/failure.dart';
import '../../data/models/get_all_series/all_series_model.dart';
import '../../data/models/get_episodes/episodes_data_model.dart';
import '../../data/models/seasons_details/seasons_details_model.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<AllSeriesModel>>> getTodoTasks(int page);
  Future<Either<Failure, List<PeopleModel>>> getAllPeople();
  Future<Either<Failure, List<EpisodesDataModel>>> getEpisodeById(int id);
  Future<Either<Failure, SeasonsDetailsModel>> getSeasonsById(int id);
  Future<Either<Failure, bool>> firebaseLogin(String email,String pass);
  Future<Either<Failure, bool>> firebaseSignUp(String email,String pass);
  Future<Either<Failure, bool>> fingerPrintLogin();


}
