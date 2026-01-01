import '../../../../../imports.dart';
import '../SpecializationScreenWidgets/specialization_list.dart';

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
        const SpecializationList(),
      ],
    );
  }
}
