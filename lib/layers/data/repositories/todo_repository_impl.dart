import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:sqin_task/layers/data/models/get_all_series/all_series_model.dart';
import 'package:sqin_task/layers/data/models/get_episodes/episodes_data_model.dart';
import 'package:sqin_task/layers/data/models/get_all_people/get_all_people_model.dart';
import 'package:sqin_task/layers/data/models/seasons_details/seasons_details_model.dart';
import '../../../commons/exception.dart';
import '../../../commons/failure.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/remote_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final RemoteDataSource remoteDataSource;

  TodoRepositoryImpl({required this.remoteDataSource});



  @override
  Future<Either<Failure, List<AllSeriesModel>>> getTodoTasks(int page) async {
    try {
      final result = await remoteDataSource.getAllSeries(page);
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<PeopleModel>>> getAllPeople() async {
    try {
      final result = await remoteDataSource.getAllPeople();
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }


  @override
  Future<Either<Failure, List<EpisodesDataModel>>> getEpisodeById(int id) async {
    try {
      final result = await remoteDataSource.getEpisodeById(id);
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }


  @override
  Future<Either<Failure, SeasonsDetailsModel>> getSeasonsById(int id) async {
    try {
      final result = await remoteDataSource.getSeasonsById(id);
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }


  @override
  Future<Either<Failure, bool>> firebaseLogin(String email,String pass) async {
    try {
      final result = await remoteDataSource.handleLogin(email,pass);
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, bool>> firebaseSignUp(String email,String pass) async {
    try {
      final result = await remoteDataSource.handleSignUp(email,pass);
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }


  @override
  Future<Either<Failure, bool>> fingerPrintLogin() async {
    try {
      final result = await remoteDataSource.fingerPrintLogin();
      return Right(result);
    } on ServerException {
      return const Left( ServerFailure(''));
    } on SocketException {
      return const Left( ConnectionFailure('Failed to connect to the network'));
    }
  }
}
