import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/app_start/controllers/app_start_cubit.dart';

import '../controllers/login_cubit.dart';

class FirebaseMobileAuth {
  // this for emiting state to ui based on response
  late final LoginCubit loginCubit;
  
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseMobileAuth(this.loginCubit);

  void verifyPhoneNumber() {
    print("Sending Push notification");
    print(loginCubit.phoneNumber.text);
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91"+loginCubit.phoneNumber.text,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
    print("verificationCompleted");
  }


  void verificationFailed(FirebaseAuthException firebaseAuthException) {
    loginCubit.showSnackBar(firebaseAuthException.message.toString(),const Icon(Icons.info_outline));
  }


  void codeSent(String i, int? j) {
    loginCubit.showSnackBar("OTP sent to " + loginCubit.phoneNumber.text,const Icon(Icons.info_outline));
    loginCubit.verificationId=i;
    loginCubit.forceResendToken=j;
    loginCubit.emit(LoginCubitStateAskOTP());
  }
  void codeAutoRetrievalTimeout(String i) {
    print(codeAutoRetrievalTimeout);
    print(i);
  }

  void VerifyOtp()async{
    try{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: loginCubit.verificationId, smsCode: loginCubit.otp.text);
    // Sign the user in (or link) with the credential
    await firebaseAuth.signInWithCredential(credential);
    BlocProvider.of<AppStartCubit>(loginCubit.scaffoldkey.currentContext!).checkAuthentication();
    }on FirebaseAuthException
    catch (e) {
      loginCubit.showSnackBar(e.message.toString(),const Icon(Icons.info_outline));
      loginCubit.emit(LoginCubitStateAskOTP());
    }
  }

}
