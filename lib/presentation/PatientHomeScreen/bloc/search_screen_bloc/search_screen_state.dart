import '../../../../data/models/user.dart';

// abstract class للستيتس
abstract class SearchScreenState {}

// الحالة الابتدائية → لا يوجد بحث بعد
class SearchInitial extends SearchScreenState {}

// حالة التحميل → عند الضغط على زر البحث
class SearchLoading extends SearchScreenState {}

// حالة تم تحميل النتائج بنجاح
class SearchLoaded extends SearchScreenState {
  final List<UserModel> results;
  SearchLoaded(this.results);

}

// حالة وجود خطأ أثناء البحث
class SearchError extends SearchScreenState {
  final String message;
  SearchError(this.message);
}
