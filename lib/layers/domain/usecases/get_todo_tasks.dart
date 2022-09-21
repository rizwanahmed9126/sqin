import 'package:dartz/dartz.dart';
import '../../../commons/failure.dart';
import '../../data/models/get_all_series/all_series_model.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetTodoTasks {
  final TodoRepository repository;

  GetTodoTasks(this.repository);

  Future<Either<Failure, List<AllSeriesModel>>> execute(int page) {
    return repository.getTodoTasks(page);
  }
}
