

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/user/domain/user_model.dart';
import 'package:idream/features/user/repository/categories.dart';
import 'package:idream/utils/mixin/scaffold_key_mixin.dart';

abstract class EditProfileCubitState{}
class ShowEditProfileCubitState extends EditProfileCubitState{}
class ShowProgressEditProfileCubitState extends EditProfileCubitState{}



class EditProfileCubit extends Cubit<EditProfileCubitState> with ScaffoldKeyMixin{

  late final LoadDataForEditProfile loadDataForEditLead;

  TextEditingController fullName=TextEditingController(text: '');
  String langunage='english';
  String board='cbsc';
  String studentClass='10';
  
  EditProfileCubit():super(ShowEditProfileCubitState()){
    loadDataForEditLead=LoadDataForEditProfile(this);
    
  }

void get saveData{
    if(fullName.text.length<4){
    showSnackBar("Name shoudld be greter than 4 alphbabet.",Icon(Icons.info));
    emit(ShowEditProfileCubitState());
    return ;
    }
    else{
      UserModel userModel=UserModel(fullName.text, langunage, "https://wallpaperaccess.com/full/2213424.jpg", studentClass, board);
      loadDataForEditLead.saveUser(userModel);
    }
    emit(ShowProgressEditProfileCubitState());
}

  
}