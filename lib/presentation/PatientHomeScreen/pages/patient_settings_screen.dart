import '../../../imports.dart';
import '../Widgets/PatientProfileWidgets/settings_list_tile.dart';
import '../bloc/patient_profile_bloc/patient_profile_cubit.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SettingsListTile(
                  icon: Icons.person,
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<PatientProfileCubit>(), // نشارك نفس الـ Cubit
                            child: const PatientAccountSettings(),
                          ),
                        ),
                      );

                    },

                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  title: 'إعدادات الحساب',
                ),
                SizedBox(height: 10),
                SettingsListTile(
                  icon: Icons.security,
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  title: 'كلمة السر',
                ),
                SizedBox(height: 10),

                SettingsListTile(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  icon: Icons.notifications_active,
                  title: 'إعدادات الإِشعارات',
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),

                SettingsListTile(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  icon: Icons.privacy_tip,
                  title: ' الخصوصية',
                ),
                SizedBox(height: 10),

                SettingsListTile(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  icon: Icons.question_mark,
                  title: 'المساعدة والدعم',
                ),
                SizedBox(height: 10),

                SettingsListTile(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  icon: Icons.person_add_alt_1_rounded,
                  title: 'دعوة صديق',
                ),
                SizedBox(height: 170),

                BasicAppButton(
                  horizontalSymmetric: 125,
                  buttonText: 'تسجيل الخروج',
                  circularBorder: 20,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const WelcomePage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
