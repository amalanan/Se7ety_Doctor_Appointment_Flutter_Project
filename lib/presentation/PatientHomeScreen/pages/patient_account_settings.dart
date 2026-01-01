import '../../../imports.dart';

class PatientAccountSettings extends StatelessWidget {
  const PatientAccountSettings({super.key});

  static const _pagePadding = EdgeInsets.all(10.0);
  static const _tilePadding = EdgeInsets.symmetric(horizontal: 6.0);
  static const _dialogPadding = EdgeInsets.all(16.0);

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
            return _buildContent(context, state);
          }
          if (state is PatientProfileError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, PatientProfileLoaded state) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: _pagePadding,
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
              _space(),
              _settingsTile(
                context,
                title: 'الصورة',
                field: 'imageUrl',
                value: state.imageUrl,
              ),

              const SizedBox(height: 30),
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
      padding: _tilePadding,
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
                padding: _dialogPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
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
                        border: _inputBorder,
                        enabledBorder: _inputBorder,
                        focusedBorder: _inputBorder,
                      ),
                    ),
                    const SizedBox(height: 10),
                    BasicAppButton(
                      verticalSymmetric: 10,
                      horizontalSymmetric: 120,
                      buttonText: 'حفظ',
                      circularBorder: 15,
                      onPressed: () {
                        context.read<PatientProfileCubit>().updateField(
                          field: field,
                          value: controller.text,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );

  Widget _space() => const SizedBox(height: 10);
}
