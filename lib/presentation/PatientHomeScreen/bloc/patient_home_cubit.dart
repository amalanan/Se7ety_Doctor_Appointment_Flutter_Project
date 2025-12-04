import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'patient_home_state.dart';

class PatientHomeCubit extends Cubit<PatientHomeState> {
  PatientHomeCubit() : super(PatientHomeInitial());

  Future<void> loadHomeData() async {
    emit(PatientHomeLoading());

    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final snapshot =
      await FirebaseFirestore.instance.collection('se7ety_users').doc(uid).get();

      final name = snapshot['name'];

      emit(PatientHomeLoaded(
        userName: name,
        currentIndex: 0,
      ));
    } catch (e) {
      emit(PatientHomeError(e.toString()));
    }
  }

  void changeBottomNav(int index) {
    if (state is PatientHomeLoaded) {
      final currentState = state as PatientHomeLoaded;

      emit(
        currentState.copyWith(
          currentIndex: index,
        ),
      );
    }
  }
}
