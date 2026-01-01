import '../../../../imports.dart';

class PatientAccountSettingsBody extends StatelessWidget {
  final PatientProfileLoaded state;

  const PatientAccountSettingsBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _tile(context, 'الاسم', 'name', state.name),
              _space(),
              _tile(context, 'رقم الهاتف', 'phone', state.phone),
              _space(),
              _tile(context, 'المدينة', 'city', state.city),
              _space(),
              _tile(context, 'نبذة تعريفية', 'bio', state.bio, maxLines: 4),
              _space(),
              _tile(context, 'العمر', 'age', state.age.toString()),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tile(
      BuildContext context,
      String title,
      String field,
      String value, {
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
        onTap: () => EditProfileFieldDialog.show(
          context,
          title: title,
          field: field,
          initialValue: value,
          maxLines: maxLines,
        ),
      ),
    );
  }

  Widget _space() => const SizedBox(height: 10);
}
