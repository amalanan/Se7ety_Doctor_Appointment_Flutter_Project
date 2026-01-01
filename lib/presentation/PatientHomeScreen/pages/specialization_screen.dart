import '../../../imports.dart';

class SpecializationScreen extends StatelessWidget {
  const SpecializationScreen({super.key, required this.specialization});

  final String specialization;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BasicAppBar(
          icon: Icons.arrow_back_ios,
          onLeadingPressed: () => Navigator.of(context).pop(),
          appTitle: specialization,
        ),
        body: BlocBuilder<SearchScreenCubit, SearchScreenState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SearchLoaded) {
              return SearchLoadedView(
                doctors: state.results,
                onTap: (doctor) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DoctorDataScreen(doctor: doctor,)),
                  );
                },
              );
            }

            if (state is SearchError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
