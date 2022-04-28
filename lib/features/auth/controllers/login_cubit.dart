

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/auth/repository/firebase_mobile_auth.dart';

import 'package:idream/utils/mixin/scaffold_key_mixin.dart';

abstract class LoginCubitState{}


class LoginCubitStateAskPhoneNumber extends LoginCubitState{}
class LoginCubitStateAskPhoneNumberWithError extends LoginCubitState{}
class LoginCubitStateShowLoadingProgress extends LoginCubitState{}
class LoginCubitStateAskOTP extends LoginCubitState{}
class LoginCubitStateShowOTPLoadingProgress extends LoginCubitState{}
class LoginCubitStateAskOTPWithError extends LoginCubitState{}


class LoginCubit extends Cubit<LoginCubitState> with ScaffoldKeyMixin{
  final TextEditingController phoneNumber=TextEditingController();
  final TextEditingController otp=TextEditingController();
  late final FirebaseMobileAuth firebaseMobileAuth;
  late String verificationId;
  late int? forceResendToken;

  LoginCubit():super(LoginCubitStateAskPhoneNumber()){
    firebaseMobileAuth=FirebaseMobileAuth(this);
  }

  void sendOtp() async{
    emit(LoginCubitStateShowLoadingProgress());
    if(phoneNumber.text =='' || phoneNumber.text.length<10){
      showSnackBar("Please Enter Valid Mobile Number", const Icon(Icons.error,color: Colors.white,));
      emit(LoginCubitStateAskPhoneNumberWithError());
      return ;
    }
    firebaseMobileAuth.verifyPhoneNumber();
  }

  void verifyOTP() async{
     emit(LoginCubitStateShowOTPLoadingProgress());
    if(otp.text =='' || otp.text.length<6){
          showSnackBar("Please Enter Valid OTP", const Icon(Icons.error,color: Colors.white,));
          emit(LoginCubitStateAskOTP());
          return ;
        }
    firebaseMobileAuth.VerifyOtp();
    
  }

}