import 'package:dartz/dartz.dart';
import '../../../commons/failure.dart';
import '../../data/models/get_episodes/episodes_data_model.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetEpisodesTasks {
  final TodoRepository repository;

  GetEpisodesTasks(this.repository);

  Future<Either<Failure, List<EpisodesDataModel>>> execute(int id) {
    return repository.getEpisodeById(id);
  }
}
