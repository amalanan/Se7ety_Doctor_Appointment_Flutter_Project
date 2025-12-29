
import '../../../../imports.dart';

class PatientHomeContent extends StatelessWidget {
  const PatientHomeContent({
    super.key,
    required this.searchController,
    required this.context,
    required this.state,
  });

  final TextEditingController searchController;
  final BuildContext context;
  final PatientHomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeSection(
                  state: state,
                  searchController: searchController,
                  parentContext: this.context,
                ),
                const SizedBox(height: 20),
                const SpecializationSection(),
                const SizedBox(height: 20),
                const TopRatedSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
