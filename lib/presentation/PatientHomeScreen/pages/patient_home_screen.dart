import '../../../imports.dart';

class PatientHomeScreen extends StatelessWidget {
  PatientHomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientHomeCubit, PatientHomeLoaded>(
      listener: (context, state) {
        context.read<SearchScreenCubit>().clearSearch();
      },
      child: BlocBuilder<PatientHomeCubit, PatientHomeLoaded>(
        builder: (context, state) {
          Widget body;
          switch (state.currentIndex) {
            case 0:
              body = PatientHomeContent(
                searchController: searchController,
                context: context,
                state: state,
              );
              break;
            case 1:
              body = PatientSearchScreen(initialQuery: state.searchQuery);
              break;
            case 2:
              body = PatientAppointmentsScreen();
              break;
            case 3:
              body = BlocProvider(
                create: (_) => PatientProfileCubit()..loadProfile(),
                child: const PatientProfileScreen(),
              );
              break;
            default:
              body = PatientHomeContent(
                searchController: searchController,
                context: context,
                state: state,
              );
          }

          return HomeScreenScaffold(
            body: body,
            searchController: searchController,
            state: state,
          );
        },
      ),
    );
  }
}
