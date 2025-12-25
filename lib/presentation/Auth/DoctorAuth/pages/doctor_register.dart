import 'package:flutter/material.dart';
import 'package:se7ety_project/imports.dart';

class DoctorRegister extends StatelessWidget {
  const DoctorRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Register(
        roleText: 'دكتور',
        homeNavigationButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DoctorRegisterContinue()),
          );
        },
        onPressedSignInButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DoctorSignIn(),
            ),
          );
        },
      ),
    );
  }
}
