import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/user.dart';
import 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchInitial());

  // دالة البحث عن دكاترة بالاسم
  Future<void> searchDoctors(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial()); // لو حقل البحث فارغ
      return;
    }

    emit(SearchLoading());

    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('se7ety_users')
              .where('role', isEqualTo: 'دكتور') // فقط الدكاترة
              .where('name'.toLowerCase(), isEqualTo: query.toLowerCase())
              .get();

      final doctors =
          snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data())) // استخدم fromJson
              .toList();
      if (doctors.isEmpty) {
        emit(SearchError('لا يوجد نتائج مطابقة'));
      } else {
        emit(SearchLoaded(doctors));
      }
    } catch (e) {
      emit(SearchError('حدث خطأ أثناء البحث: ${e.toString()}'));
    }
  }

  Future<void> searchDoctorsBySpecialization(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial()); // لو حقل البحث فارغ
      return;
    }

    emit(SearchLoading());

    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('se7ety_users')
              .where('role', isEqualTo: 'دكتور') // فقط الدكاترة
              .where('specialization', isEqualTo: query.toLowerCase())
              .get();

      final doctors =
          snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data())) // استخدم fromJson
              .toList();
      if (doctors.isEmpty) {
        emit(SearchError('لا يوجد نتائج مطابقة'));
      } else {
        emit(SearchLoaded(doctors));
      }
    } catch (e) {
      emit(SearchError('حدث خطأ أثناء البحث: ${e.toString()}'));
    }
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}
