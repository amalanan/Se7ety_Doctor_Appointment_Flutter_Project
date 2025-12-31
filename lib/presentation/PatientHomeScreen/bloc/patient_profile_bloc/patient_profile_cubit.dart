import '../../../../imports.dart';

class PatientProfileCubit extends Cubit<PatientProfileState> {
  PatientProfileCubit() : super(PatientProfileLoading());

  Future<void> loadProfile() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final doc =
          await FirebaseFirestore.instance
              .collection('se7ety_users')
              .doc(uid)
              .get();

      emit(
        PatientProfileLoaded(
          name: doc['name'],
          city: doc['city'],
          bio: doc['bio'],
          email: doc['email'],
          phone: doc['phone'],
          imageUrl: doc['imageUrl'],
        ),
      );
    } catch (e) {
      emit(PatientProfileError(e.toString()));
    }
  }
}
