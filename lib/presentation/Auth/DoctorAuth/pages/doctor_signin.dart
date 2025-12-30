import '../../../../imports.dart';

class DoctorSignIn extends StatelessWidget {
  const DoctorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(
        roleText: 'دكتور',
        onSuccess: () => DoctorAuthNavigation.toDoctorHome(context),
        onRegister: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DoctorRegister()),
          );
        },
      ),
    );
  }
}
