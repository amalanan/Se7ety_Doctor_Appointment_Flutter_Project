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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 30),
              child: SearchTextField(
                onSubmitted: (value) {
                  final query = value.trim();
                  context.read<SearchScreenCubit>().searchDoctors(query);
                },
                iconColor: Colors.white,
                searchColor: AppColors.primary,
                hintText: 'البحث',
                onPressed: () {
                  final query = searchController.text.trim();
                  if (query.isEmpty) return;
                  context.read<SearchScreenCubit>().searchDoctors(query);
                },
                searchController: searchController,
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchScreenCubit, SearchScreenState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    // صورة البداية لو الحقل فارغ
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 80),
                          //  Text('بحث عن: $initialQuery'),
                          Text(
                            'عرض كل الدكاترة',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 250,
                            child: Image.asset(AppImages.noSearch),
                          ),
                        ],
                      ),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    final doctors = state.results;
                    if (doctors.isEmpty) {
                      return Center(child: Text('لا يوجد دكاترة'));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = doctors[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(15),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(' 3 ', style: TextStyle(fontSize: 15)),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    doctor.imageUrl != null
                                        ? NetworkImage(doctor.imageUrl!)
                                        : AssetImage(AppImages.splashLogo)
                                            as ImageProvider,
                                backgroundColor: Colors.white,
                              ),
                              title: Text(
                                doctor.name ?? 'غير معروف',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                doctor.specialization ?? 'لا يوجد تخصص',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }
                  searchController.clear();

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
