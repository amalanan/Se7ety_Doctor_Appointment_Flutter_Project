import '../../../../imports.dart';

class PatientRegister extends StatelessWidget {
  const PatientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Register(
        roleText: 'مريض',
        onSuccess: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>  PatientRegisterContinue(),
            ),
          );
        },
        onSignIn: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const PatientSignIn()),
          );
        },
      ),
    );
  }
}
