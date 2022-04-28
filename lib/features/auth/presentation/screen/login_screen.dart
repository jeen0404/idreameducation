import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/login_cubit.dart';
import '../widget/auth_widget.dart';

class LoginScreen extends StatelessWidget {
  final LoginCubit loginCubit = LoginCubit();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginCubit.scaffoldkey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),

          /// [iDreamEducationTextLogo] is an text logo widget
          iDreamEducationTextLogo,

          /// taking ui to bottom
          Expanded(child: Container()),

          BlocBuilder<LoginCubit, LoginCubitState>(
              bloc: loginCubit,
              builder: (context, loginState) {
                if (loginState is LoginCubitStateAskOTP) {}

                return Column(
                  children: [
                    Text(
                      "Let's get started",
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: loginCubit.phoneNumber,
                        style: const TextStyle(
                            letterSpacing: 2, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "0000000000",
                            prefixIcon: IconButton(
                              icon: const Padding(
                                padding: EdgeInsets.only(bottom: 7),
                                child: Text(
                                  "+91",
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            )),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    loginState is LoginCubitStateShowLoadingProgress
                        ? Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            child: Material(
                              color: Colors.blueAccent,
                              elevation: 8,
                              borderRadius: BorderRadius.circular(15),
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            ),
                          )
                        : Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            child: Material(
                              color: Colors.blue,
                              elevation: 8,
                              borderRadius: BorderRadius.circular(15),
                              child: InkWell(
                                onTap: () => loginCubit.sendOtp(),
                                highlightColor: Colors.blueAccent,
                                child: Center(
                                  child: Text(
                                    "Continue",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                        )),
                        Text(" or continue with "),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                        )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    /// Social Login Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [googleButton, iCloudButton],
                    )
                  ],
                );
              }),

          const SizedBox(
            height: 50,
          )
        ],
      ),
      bottomSheet: BlocBuilder<LoginCubit, LoginCubitState>(
        bloc: loginCubit,
        builder: (context, loginState) {
          if (loginState is LoginCubitStateAskOTP) {
            return Container(
              height: 250,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Enter OTP',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: 200,
                        child: TextField(
                          controller: loginCubit.otp,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        )),
                    ElevatedButton(
                        child: const Text(
                          'Verify OTP',
                        ),
                        onPressed: () => loginCubit.verifyOTP())
                  ],
                ),
              ),
            );
          }
          if (loginState is LoginCubitStateShowOTPLoadingProgress) {
            return Container(
              height: 250,
              color: Colors.amber,
              child: const Center(
                child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(color: Colors.white,)),
              ),
            );
          } else {
            return const SizedBox(
              height: 0,
              width: 0,
            );
          }
        },
      ),
    );
  }
}
