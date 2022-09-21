import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:sqin_task/layers/data/models/get_episodes/episodes_data_model.dart';
import 'package:sqin_task/layers/data/models/seasons_details/seasons_details_model.dart';

import '../../../commons/constants.dart';
import '../../../commons/exception.dart';
import '../../presentation/resusable_widgets/snackBar_message.dart';
import '../models/get_all_series/all_series_model.dart';
import '../models/get_all_people/get_all_people_model.dart';


abstract class RemoteDataSource {
  Future<List<AllSeriesModel>> getAllSeries(int page);
  Future<List<PeopleModel>> getAllPeople();
  Future<List<EpisodesDataModel>> getEpisodeById(int id);
  Future<SeasonsDetailsModel> getSeasonsById(int id);
  Future<AllSeriesModel> getSeriesById(int id);
  Future<bool> handleLogin(String email,String password);
  Future<bool> handleSignUp(String email,String password);
  Future<bool> fingerPrintLogin();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<AllSeriesModel>> getAllSeries(int page) async {
    final response = await client.get(Uri.parse(Urls.seasonUrl(page)));

    if (response.statusCode == 200) {
      final infoAndResult = json.decode(response.body);

      List<AllSeriesModel> todoTasks=[];
      for (var abc in infoAndResult) {
        todoTasks.add(AllSeriesModel.fromJson(abc));
      }

      return todoTasks;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PeopleModel>> getAllPeople() async {
    final response = await client.get(Uri.parse(Urls.allPeopleUrl()));

    if (response.statusCode == 200) {
      final infoAndResult = json.decode(response.body);

      List<PeopleModel> todoTasks=[];
      for (var abc in infoAndResult) {
        todoTasks.add(PeopleModel.fromMap(abc));
      }

      return todoTasks;
    } else {
      throw ServerException();
    }
  }


  @override
  Future<AllSeriesModel> getSeriesById(int page) async {
    final response = await client.get(Uri.parse(Urls.seriesByIdUrl(page)));

    if (response.statusCode == 200) {
      final infoAndResult = json.decode(response.body);

      //AllSeriesModel? todoTasks;
      //for (var abc in infoAndResult) {
       // todoTasksAllSeriesModel.fromJson(abc));
     // }

      return AllSeriesModel.fromJson(infoAndResult);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EpisodesDataModel>> getEpisodeById(int id,) async {

    final response = await client.get(Uri.parse(Urls.episodesUrl(id)));

    if (response.statusCode == 200) {
      final infoAndResult = json.decode(response.body);

      List<EpisodesDataModel> todoTasks=[];
      for (var abc in infoAndResult) {
        todoTasks.add(EpisodesDataModel.fromJson(abc));
      }

      return todoTasks;
    } else {
      throw ServerException();
    }
}
  @override
  Future<SeasonsDetailsModel> getSeasonsById(int id,) async {

    final response = await client.get(Uri.parse(Urls.seasonsByIDUrl(id)));

    if (response.statusCode == 200) {
      final infoAndResult = json.decode(response.body);


      SeasonsDetailsModel? todoTasks;
      // for (var abc in infoAndResult) {
      //   todoTasks.add(SeasonsDetailsModel.fromJson(abc));
      // }
      todoTasks=SeriesDetailedInfoModel.fromMap(infoAndResult);




      return todoTasks;
    } else {
      throw ServerException();
    }
  }



  @override
  Future<bool> handleLogin(String email,String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _ultil=  UtilService();


    try{



    if(email.isNotEmpty || password.isNotEmpty){
      UserCredential result =  await _auth.signInWithEmailAndPassword(email:email, password: password);
      final User user = result.user!;

      return true;

    }
    else{
      _ultil.showToast("Please Check your Email and Password");
      return false;
    }

  }on FirebaseAuthException catch (err) {
    _ultil.showToast(err.toString());
    return false;

  }

}



  @override
  Future<bool> handleSignUp(String email,String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _ultil=  UtilService();


    try{
      if(email.isNotEmpty || password.isNotEmpty){
        UserCredential result =  await _auth.createUserWithEmailAndPassword(email:email, password: password);
        final User user = result.user!;

        return true;

      }
      else{
        _ultil.showToast("Please Check your Email and Password");
        return false;
      }

    }on FirebaseAuthException catch (err) {
      _ultil.showToast(err.toString());
      return false;

    }

  }


  @override
  Future<bool> fingerPrintLogin() async {
    final LocalAuthentication auth = LocalAuthentication();
    final _ultil=  UtilService();


    try{
    bool authenticate=  await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    return authenticate;

    }on PlatformException catch (e) {
      _ultil.showToast(e.toString());
      return false;

    }

  }

}
