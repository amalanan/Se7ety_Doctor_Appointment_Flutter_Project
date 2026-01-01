import '../../../../../imports.dart';
import '../../pages/specialization_screen.dart';
import 'specialization_model.dart';

class SpecializationCardItem extends StatelessWidget {
  final SpecializationModel item;

  const SpecializationCardItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return HomeDoctorCards(
      cardColor: item.color.shade100,
      specialization: item.title,
      onTap: () => _openSpecialization(context),
    );
  }

  void _openSpecialization(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<SearchScreenCubit>()
            ..searchDoctorsBySpecialization(item.title),
          child: SpecializationScreen(
            specialization: item.title,
          ),
        ),
      ),
    );
  }
}
