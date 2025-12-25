import 'package:flutter/material.dart';
import '../../../../imports.dart';

class DoctorSignIn extends StatelessWidget {
  const DoctorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(
        roleText: 'دكتور',
        homeNavigationButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DoctorHomeScreen()),
          );
        },
        onPressedRegisterButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DoctorRegister()),
          );
        },
      ),
    );
  }
}
