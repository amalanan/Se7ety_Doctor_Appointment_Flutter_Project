import '../../../imports.dart';

class PatientSettingsScreen extends StatelessWidget {
  const PatientSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        appTitle: 'الإعدادت',
        trailingIcon: Icons.arrow_forward_ios,
        onTrailingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SettingsScreenBody(),
    );
  }
}

