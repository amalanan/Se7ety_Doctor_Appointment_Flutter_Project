import '../../../imports.dart';

class PatientSearchScreen extends StatelessWidget {
  PatientSearchScreen({super.key, required this.initialQuery});

  final String initialQuery;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    searchController.text = initialQuery;

    return Scaffold(
      appBar: BasicAppBar(appTitle: 'ابحث عن دكتور'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SearchInputSection(
              searchController: searchController,
            ),
            Expanded(
              child: SearchBody(
                searchController: searchController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
