import 'package:hive_flutter/hive_flutter.dart';
import 'package:idream/core/database/hive/single_key_repository.dart';
import 'package:idream/features/user/domain/user_model.dart';

class UserHive{
  
  late Box hiveBox;
  final String boxName='user_hive';

  UserHive() {
    hiveBox = Hive.box(boxName);
  }

  UserModel? get(){
    return  hiveBox.get('user');
  }

  Future<void> put(UserModel userModel)async{
    return await hiveBox.put('user',userModel);
  }

   void delete() async => await hiveBox.delete('user');
}

class AppCacheHive extends SingleKeyRepository{
  AppCacheHive():super('app_cache');
  
}