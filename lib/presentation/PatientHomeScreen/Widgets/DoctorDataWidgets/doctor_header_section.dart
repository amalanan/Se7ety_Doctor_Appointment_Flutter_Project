import '../../../../data/models/user.dart';
import '../../../../imports.dart';

class DoctorHeaderSection extends StatelessWidget {
  const DoctorHeaderSection({super.key, required this.doctor});

  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: doctor.imageUrl != null && doctor.imageUrl!.isNotEmpty
              ? NetworkImage(doctor.imageUrl!)
              : const AssetImage(AppImages.splashLogo) as ImageProvider,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name ?? 'غير معروف',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              doctor.specialization ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(' 3 ', style: TextStyle(fontSize: 15, color: Colors.black)),
                Icon(Icons.star, color: Colors.orange, size: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
