import '../../../imports.dart';

class DoctorAuthNavigation {
  static void toDoctorHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DoctorHomeScreen()),
    );
  }

  static void toDoctorRegisterContinue(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DoctorRegisterContinue()),
    );
  }
}
