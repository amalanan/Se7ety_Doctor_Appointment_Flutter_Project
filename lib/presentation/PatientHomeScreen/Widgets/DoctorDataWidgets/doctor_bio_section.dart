import '../../../../data/models/user.dart';
import '../../../../imports.dart';

class DoctorBioSection extends StatelessWidget {
  const DoctorBioSection({super.key, required this.doctor});

  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نبذة تعريفية',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          doctor.bio?.isNotEmpty == true ? doctor.bio! : 'لم تضاف',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
