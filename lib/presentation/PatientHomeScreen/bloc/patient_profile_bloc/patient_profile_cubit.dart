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
          age: doc['age'],
        ),
      );
    } catch (e) {
      emit(PatientProfileError(e.toString()));
    }
  }


  Future<void> updateField({
    required String field,
    required dynamic value,
  }) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('se7ety_users')
          .doc(uid)
          .update({field: value});

      await loadProfile(); // نرجّع نحمّل البيانات
    } catch (e) {
      emit(PatientProfileError(e.toString()));
    }
  }
}