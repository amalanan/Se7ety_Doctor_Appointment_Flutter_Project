import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/models/user.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Future<void> addBooking({
    required String patientName,
    required String phone,
    required String description,
    required String date,
    required String time,
    required UserModel doctorName
  }) async {
    emit(BookingLoading());

    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('se7ety_users')
          .doc(uid)
          .collection('bookings')
          .add({
        'patientName': patientName,
        'doctorName': doctorName.toJson(),
        'phone': phone,
        'description': description,
        'date': date,
        'time': time,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(BookingSuccess());
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}
