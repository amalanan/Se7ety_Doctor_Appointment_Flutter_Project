import '../../../../imports.dart';

class HomeDoctorCards extends StatelessWidget {
  final String specialization;
  final Color cardColor;

  const HomeDoctorCards({
    super.key,
    required this.cardColor,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 200,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(AppImages.doctorCard),
          const SizedBox(height: 10),
          Text(
            specialization,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
