import '../../../imports.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        onLeadingPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<PatientProfileCubit>(), // نشارك نفس الـ Cubit
                child: const PatientSettingsScreen(),
              ),
            ),
          );

        },
        icon: Icons.settings,
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
