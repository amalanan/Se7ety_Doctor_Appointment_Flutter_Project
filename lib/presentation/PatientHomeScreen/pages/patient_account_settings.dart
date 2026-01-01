import '../../../imports.dart';

class PatientAccountSettings extends StatelessWidget {
  const PatientAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        appTitle: 'إعدادات الحساب',
        trailingIcon: Icons.arrow_forward_ios,
        onTrailingPressed: () => Navigator.of(context).pop(),
      ),
      body: BlocBuilder<PatientProfileCubit, PatientProfileState>(
        builder: (context, state) {
          if (state is PatientProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PatientProfileLoaded) {
            return PatientAccountSettingsBody(state: state);
          }
          if (state is PatientProfileError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
