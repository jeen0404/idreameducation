import 'package:hive/hive.dart';

abstract class SingleKeyRepository<T> {
  /// for single item repository
  late Box hiveBox;

  SingleKeyRepository(boxName) {
    hiveBox = Hive.box(boxName);
  }

  // get item from box
  T? get(key) {
    return hiveBox.get(key);
  }

  /// get item from api
  put(key,value) {
    return hiveBox.put(key, value);
  }

  //delete item
  delete(key) {
    return hiveBox.delete(key);
  }
/// put data to local
}

abstract class TypeAdapterRepository<T>{
  late Box hiveBox;

  TypeAdapterRepository(boxName) {
    hiveBox = Hive.box<T>(boxName);
  }

  get(key){
    return hiveBox.get(key);
  }

  void put(key, object){
    hiveBox.put(key,object);
  }
  void delete(key){
    hiveBox.delete(key);
  }


}
