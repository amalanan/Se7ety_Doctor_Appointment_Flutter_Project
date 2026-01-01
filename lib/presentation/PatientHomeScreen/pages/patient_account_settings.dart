import '../../../imports.dart';
import '../Widgets/PatientProfileWidgets/settings_list_tile.dart';
import '../bloc/patient_profile_bloc/patient_profile_cubit.dart';

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
          } else if (state is PatientProfileLoaded) {
            return _buildContent(context, state); // البيانات جاهزة
          } else if (state is PatientProfileError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, PatientProfileLoaded state) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _settingsTile(
                context,
                title: 'الاسم',
                field: 'name',
                value: state.name,
              ),
              _space(),
              _settingsTile(
                context,
                title: 'رقم الهاتف',
                field: 'phone',
                value: state.phone,
              ),
              _space(),
              _settingsTile(
                context,
                title: 'المدينة',
                field: 'city',
                value: state.city,
              ),
              _space(),
              _settingsTile(
                context,
                title: 'نبذة تعريفية',
                field: 'bio',
                value: state.bio,
                maxLines: 4,
              ),
              _space(),
              _settingsTile(
                context,
                title: 'العمر',
                field: 'age',
                value: state.age.toString(),
              ),
              const SizedBox(height: 30),
              /*     BasicAppButton(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsTile(
    BuildContext context, {
    required String title,
    required String field,
    required String value,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SettingsListTile(
        leading: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Text(value, style: const TextStyle(fontSize: 18)),
        onTap:
            () => _editField(
              context,
              title: title,
              field: field,
              initialValue: value,
              maxLines: maxLines,
            ),
      ),
    );
  }

  void _editField(
    BuildContext context, {
    required String title,
    required String field,
    required String initialValue,
    int maxLines = 1,
  }) {
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder:
          (_) => Directionality(
            textDirection: TextDirection.rtl,
            child: Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'تعديل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        filled: true,
                        fillColor: Colors.blue.withOpacity(0.09),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    BasicAppButton(
                      verticalSymmetric: 10,
                      horizontalSymmetric: 120,
                      buttonText: 'حفظ',
                      circularBorder: 15,
                      onPressed: () async {
                        context.read<PatientProfileCubit>().updateField(
                          field: field,
                          value: controller.text,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    /*  ElevatedButton(
                      onPressed: () async {
                        context.read<PatientProfileCubit>().updateField(
                          field: field,
                          value: controller.text,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'حفظ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _space() => const SizedBox(height: 10);
}
