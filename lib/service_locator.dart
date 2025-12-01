import 'package:get_it/get_it.dart';
import 'package:se7ety_project/domain/usecases/auth/complete_doctor_registeration_usecase.dart';
import 'imports.dart';



final sl = GetIt.instance;
Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<CompleteDoctorRegisterationUsecase>(CompleteDoctorRegisterationUsecase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());

}