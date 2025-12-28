import '../../../imports.dart';

class PatientHomeScreen extends StatelessWidget {
  PatientHomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientHomeCubit, PatientHomeLoaded>(
      listener: (context, state) {
        // أي تغيير تاب → يمسح البحث تلقائياً
        context.read<SearchScreenCubit>().clearSearch();
      },
      child: BlocBuilder<PatientHomeCubit, PatientHomeLoaded>(
        builder: (context, state) {
          Widget body;
          switch (state.currentIndex) {
            case 0:
              body = _homeContent(context, state);
              break;
            case 1:
              body = PatientSearchScreen(initialQuery: state.searchQuery);
              break;
            case 2:
              body = PatientAppointmentsScreen();
              break;
            case 3:
              body = PatientProfileScreen();
              break;
            default:
              body = _homeContent(context, state);
          }

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
                    _navItem(context, Icons.home, 'الرئيسية', 0, state),
                    _navItem(context, Icons.search, 'البحث', 1, state),
                    _navItem(
                      context,
                      Icons.calendar_month,
                      'المواعيد',
                      2,
                      state,
                    ),
                    _navItem(context, Icons.person, 'الحساب', 3, state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // دالة محتوى الرئيسية
  Widget _homeContent(BuildContext context, PatientHomeLoaded state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'صــحّتـي',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.notifications_active,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
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
                  onSubmitted: (value) {
                    final query = value.trim();
                    if (query.isEmpty) return;
                    context.read<PatientHomeCubit>().goToSearch(query);
                  },
                  iconColor: Colors.white,
                  searchColor: AppColors.primary,
                  hintText: 'ابحث عن دكتور',
                  onPressed: () {
                    final query = searchController.text.trim();
                    if (query.isEmpty) return;
                    context.read<PatientHomeCubit>().goToSearch(query);
                  },

                  searchController: searchController,
                ),
                const SizedBox(height: 20),
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
                      doctorCard(
                        cardColor: Colors.blueAccent.shade100,
                        specialization: 'جراحة عامة',
                      ),
                      const SizedBox(width: 20),
                      doctorCard(
                        cardColor: Colors.green.shade200,
                        specialization: 'دكتور قلب',
                      ),
                      const SizedBox(width: 20),
                      doctorCard(
                        cardColor: Colors.orange.shade100,
                        specialization: 'دكتور عظام',
                      ),
                      const SizedBox(width: 20),
                      doctorCard(
                        cardColor: Colors.blueGrey.shade100,
                        specialization: 'دكتور جلدية',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'الأعلى تقييما',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    trailing: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(' 3 ', style: TextStyle(fontSize: 15)),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(AppImages.splashLogo),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      'علي  بن خالد ',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'جراحة عامة',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    PatientHomeLoaded state,
  ) {
    final isSelected = state.currentIndex == index;

    return GestureDetector(
      onTap: () {
        // أولاً نمسح البحث
        searchController.clear();
        context.read<SearchScreenCubit>().clearSearch();

        // بعدين نغيّر التاب
        context.read<PatientHomeCubit>().changeBottomNav(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 26,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class doctorCard extends StatelessWidget {
  final String specialization;
  final Color cardColor;

  const doctorCard({
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
