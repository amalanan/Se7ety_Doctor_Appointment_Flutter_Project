import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../imports.dart';
import '../../../PatientHomeScreen/bloc/home_screen_bloc/patient_home_cubit.dart';

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
                  builder :  (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (_) => PatientHomeCubit()..loadHomeData()),
                      BlocProvider(create: (_) => SearchScreenCubit()),
                    ],
                    child: PatientHomeScreen(),
                  )

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
