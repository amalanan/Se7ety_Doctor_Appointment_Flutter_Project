import '../../../../imports.dart';

class PatientHomeCubit extends Cubit<PatientHomeLoaded> {
  PatientHomeCubit()
    : super(PatientHomeLoaded(currentIndex: 0, searchQuery: '', userName: ''));

  Future<void> loadHomeData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final snapshot =
          await FirebaseFirestore.instance
              .collection('se7ety_users')
              .doc(uid)
              .get();

      final name = snapshot['name'];

      emit(
        PatientHomeLoaded(
          userName: name,
          currentIndex: 0,
          searchQuery: state.searchQuery,
        ),
      );
    } catch (e) {
      emit(PatientHomeError(e.toString()) as PatientHomeLoaded);
    }
  }

  void changeBottomNav(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void goToSearch(String query) {
    emit(state.copyWith(searchQuery: query, currentIndex: 1));
  }
}
