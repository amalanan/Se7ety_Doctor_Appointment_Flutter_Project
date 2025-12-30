
import '../../../imports.dart';
class AuthNavigation {
  static void toPatientHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PatientHomeCubit()..loadHomeData()),
            BlocProvider(create: (_) => SearchScreenCubit()),
          ],
          child: PatientHomeScreen(),
        ),
      ),
    );
  }
}
