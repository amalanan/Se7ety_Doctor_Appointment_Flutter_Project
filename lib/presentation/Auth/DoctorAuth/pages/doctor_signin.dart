import 'package:flutter/material.dart';
import '../../../../imports.dart';

class DoctorSignIn extends StatelessWidget {
  const DoctorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(roleText: 'دكتور', onPressedHomeButton: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DoctorHomeScreen(),
          ),
        );
      }, onPressedRegisterButton:  () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DoctorRegister(),
          ),
        );
      }),
    );
  }
}
