import 'package:dartz/dartz.dart';
import '../../../commons/failure.dart';
import '../../data/models/get_all_series/all_series_model.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class AuthenticationTasks {
  final TodoRepository repository;

  AuthenticationTasks(this.repository);

  Future<Either<Failure, bool>> login(String email,String pass) {
    return repository.firebaseLogin(email,pass);
  }
  Future<Either<Failure, bool>> signUp(String email,String pass) {
    return repository.firebaseSignUp(email,pass);
  }

  Future<Either<Failure, bool>> fingerPrint() {
    return repository.fingerPrintLogin();
  }
}
