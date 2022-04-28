import 'package:flutter/material.dart';
import 'package:idream/features/auth/presentation/widget/auth_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iDreamEducationTextLogo,
        ],
      ),
    );
  }
}