import 'package:se7ety_project/data/models/user.dart';
import 'package:se7ety_project/presentation/PatientHomeScreen/bloc/search_screen_bloc/search_screen_state.dart';

import '../../../../imports.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final AuthFirebaseService repo; // لازم تمرر الـ repo

  SearchScreenCubit({required this.repo}) : super(SearchInitial());

  Future<void> searchDoctors(String query) async {
    emit(SearchLoading());

    try {
      final eitherResult = await repo.searchDoctors(query);

      eitherResult.fold(
            (error) => emit(SearchError(error)), // Left → خطأ
            (results) => emit(SearchLoaded(results.cast<UserModel>())), // Right → List<Map<String, dynamic>>
      );
    } catch (e) {
      emit(SearchError('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }
}
