import 'package:dartz/dartz.dart';
import 'package:sqin_task/layers/data/models/seasons_details/seasons_details_model.dart';
import '../../../commons/failure.dart';
import '../../data/models/get_episodes/episodes_data_model.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetSeasonsTasks {
  final TodoRepository repository;

  GetSeasonsTasks(this.repository);

  Future<Either<Failure, SeasonsDetailsModel>> execute(int id) {
    return repository.getSeasonsById(id);
  }
}
