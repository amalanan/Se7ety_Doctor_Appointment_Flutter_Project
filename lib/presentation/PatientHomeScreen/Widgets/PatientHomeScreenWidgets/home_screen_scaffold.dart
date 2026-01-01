import '../../../../imports.dart';

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({
    super.key,
    required this.body,
    required this.searchController,
    required this.state
  });

  final Widget body;
  final TextEditingController searchController;
  final PatientHomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigationBarHomeScreen(
                searchController: searchController,
                context: context,
                icon: Icons.home,
                label: 'الرئيسية',
                index: 0,
                state: state,
              ),
              BottomNavigationBarHomeScreen(
                searchController: searchController,
                context: context,
                icon: Icons.search,
                label: 'البحث',
                index: 1,
                state: state,
              ),
              BottomNavigationBarHomeScreen(
                searchController: searchController,
                context: context,
                icon: Icons.calendar_month,
                label: 'المواعيد',
                index: 2,
                state: state,
              ),
              BottomNavigationBarHomeScreen(
                searchController: searchController,
                context: context,
                icon: Icons.person,
                label: 'الحساب',
                index: 3,
                state: state,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
