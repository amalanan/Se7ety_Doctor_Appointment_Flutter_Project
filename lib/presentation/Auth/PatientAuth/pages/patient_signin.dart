import 'package:flutter/material.dart';
import '../../../../imports.dart';

class PatientSignIn extends StatelessWidget {
  const PatientSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(
        roleText: 'مريض',
        onPressedHomeButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PatientHomeScreen(),
            ),
          );
        },
        onPressedRegisterButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PatientRegister(),
            ),
          );
        },
      ),
    );
  }
}
