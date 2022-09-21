


import 'package:shared_preferences/shared_preferences.dart';

import '../../../commons/error.dart';

abstract class LocalDataSource {
  Future<bool> deleteList({required String key});
  Future<List<String>> fetchList({required String key});
  Future<bool> saveList({required String key, required List<String> value});
}


class LocalDataSourceImp implements LocalDataSource{
  @override
  Future<bool> deleteList({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      return storage.remove(key);
    } catch (e) {
      print(e.toString());
      throw CacheError.failedToDelete();
    }
  }



  @override
  Future<List<String>> fetchList({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();

      return storage.getStringList(key) ?? [];
    } catch (e) {
      print(e.toString());
      throw CacheError.failedToRetrieveData();
    }
  }

  @override
  Future<bool> saveList({required String key, required List<String> value}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      return storage.setStringList(key, value);
    } catch (e) {
      print(e.toString());
      throw CacheError.failedToSave();
    }
  }
}