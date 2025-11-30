import 'package:flutter/material.dart';
import '../../../../imports.dart';

class PatientRegister extends StatelessWidget {
  const PatientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Register(
        roleText: 'مريض',
        homeNavigationButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PatientHomeScreen()),
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
