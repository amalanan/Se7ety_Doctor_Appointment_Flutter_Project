import '../../../../imports.dart';

class DoctorRegister extends StatelessWidget {
  const DoctorRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Register(
        roleText: 'دكتور',
        onSuccess: () => DoctorAuthNavigation.toDoctorRegisterContinue(context),
        onSignIn: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DoctorSignIn()),
          );
        },
      ),
    );
  }
}
