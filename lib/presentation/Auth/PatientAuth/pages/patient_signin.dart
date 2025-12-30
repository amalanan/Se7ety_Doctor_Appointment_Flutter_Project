import '../../../../imports.dart';

class PatientSignIn extends StatelessWidget {
  const PatientSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(
        roleText: 'مريض',
        onSuccess: () => AuthNavigation.toPatientHome(context),
        onRegister: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PatientRegister()),
          );
        },
      ),
    );
  }
}
