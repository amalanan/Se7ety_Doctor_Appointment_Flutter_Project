import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../imports.dart';
import '../../../PatientHomeScreen/bloc/patient_home_cubit.dart';

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
                MaterialPageRoute(
                  builder :  (_) => BlocProvider(
                    create: (_) => PatientHomeCubit()..loadHomeData(),
                    child:  PatientHomeScreen(),
                  ),
                ),
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
