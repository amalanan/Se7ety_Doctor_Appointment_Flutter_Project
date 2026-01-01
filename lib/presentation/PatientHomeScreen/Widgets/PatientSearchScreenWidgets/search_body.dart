import 'package:se7ety_project/presentation/PatientHomeScreen/pages/doctor_data_screen.dart';

import '../../../../imports.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenCubit, SearchScreenState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const SearchInitialView();
        }

        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchLoaded) {
          if (state.results.isEmpty) {
            return const Center(child: Text('لا يوجد دكاترة'));
          }
          return SearchLoadedView(
            doctors: state.results,
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => DoctorDataScreen()),
              );
            },
          );
        }

        if (state is SearchError) {
          return SearchErrorView(message: state.message);
        }

        searchController.clear();
        return const SizedBox();
      },
    );
  }
}
