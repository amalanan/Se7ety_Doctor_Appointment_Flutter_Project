import '../../../../data/models/user.dart';
import '../../../../imports.dart';

class DoctorClinicSection extends StatelessWidget {
  const DoctorClinicSection({super.key, required this.doctor});

  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconCircle(Icons.watch_later_outlined),
                const SizedBox(height: 20),
                _iconCircle(Icons.location_on_rounded),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AM ${doctor.workingHoursFrom ?? ''}  - ${doctor.workingHoursTo ?? ''} PM',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(height: 40),
                Text(
                  '${doctor.clinicAddress ?? ''} ${doctor.city ?? ''}',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconCircle(IconData icon) {
    return Container(
      width: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
