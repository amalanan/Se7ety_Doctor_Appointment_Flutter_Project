import '../../../imports.dart';
import '../Widgets/profile_body.dart';
import '../bloc/patient_profile_bloc/patient_profile_cubit.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        icon: const Icon(Icons.settings, color: Colors.white),
        appTitle: 'الحساب الشخصي',
      ),
      body: BlocBuilder<PatientProfileCubit, PatientProfileState>(
        builder: (context, state) {
          if (state is PatientProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PatientProfileLoaded) {
            return ProfileBody(state);
          }

          if (state is PatientProfileError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
