import 'package:flutter/material.dart';

import '../../../../imports.dart';
class PatientRegister extends StatelessWidget {
  const PatientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Register(
        roleText: 'مريض',
        onPressedHomeButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PatientHomeScreen(),
            ),
          );
        },
        onPressedSignInButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PatientSignIn(),
            ),
          );
        },
      ),
    );
  }
}
