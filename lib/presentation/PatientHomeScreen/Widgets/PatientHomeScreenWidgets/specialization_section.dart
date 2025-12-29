import '../../../../../imports.dart';

class SpecializationSection extends StatelessWidget {
  const SpecializationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'التخصصات',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 270,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              HomeDoctorCards(
                cardColor: Colors.blueAccent.shade100,
                specialization: 'جراحة عامة',
              ),
              const SizedBox(width: 20),
              HomeDoctorCards(
                cardColor: Colors.green.shade200,
                specialization: 'دكتور قلب',
              ),
              const SizedBox(width: 20),
              HomeDoctorCards(
                cardColor: Colors.orange.shade100,
                specialization: 'دكتور عظام',
              ),
              const SizedBox(width: 20),
              HomeDoctorCards(
                cardColor: Colors.blueGrey.shade100,
                specialization: 'دكتور جلدية',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
