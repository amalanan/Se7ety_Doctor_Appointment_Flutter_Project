import '../../../../../imports.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    super.key,
    required this.state,
    required this.searchController,
    required this.parentContext,
  });

  final PatientHomeLoaded state;
  final TextEditingController searchController;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('مرحبا,', style: TextStyle(fontSize: 18)),
            Text(
              '${state.userName} ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'احجز الان وكن جزءا من رحلتك الصحية.',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SearchTextField(
          searchController: searchController,
          hintText: 'ابحث عن دكتور',
          iconColor: Colors.white,
          searchColor: AppColors.primary,
          onSubmitted: (value) {
            final query = value.trim();
            if (query.isEmpty) return;
            parentContext.read<PatientHomeCubit>().goToSearch(query);
          },
          onPressed: () {
            final query = searchController.text.trim();
            if (query.isEmpty) return;
            parentContext.read<PatientHomeCubit>().goToSearch(query);
          },
        ),
      ],
    );
  }
}
