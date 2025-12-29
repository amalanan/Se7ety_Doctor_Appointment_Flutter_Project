import '../../../imports.dart';

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
}
