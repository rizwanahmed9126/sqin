import 'package:dartz/dartz.dart';
import 'package:sqin_task/layers/data/models/get_all_people/get_all_people_model.dart';
import '../../../commons/failure.dart';
import '../../data/models/get_all_series/all_series_model.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetPeople {
  final TodoRepository repository;

  GetPeople(this.repository);

  Future<Either<Failure, List<PeopleModel>>> execute() {
    return repository.getAllPeople();
  }
}
