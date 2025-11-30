import 'package:flutter/material.dart';
import '../../../../imports.dart';

class PatientSignIn extends StatelessWidget {
  const PatientSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(
        roleText: 'مريض',
        homeNavigationButton:
            () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PatientHomeScreen()),
          );
        },
        onPressedRegisterButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PatientRegister()),
          );
        },
      ),
    );
  }
}
