import 'package:get_it/get_it.dart';
import 'imports.dart';



final sl = GetIt.instance;
Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<CompleteDoctorRegisterationUsecase>(CompleteDoctorRegisterationUsecase());
  sl.registerSingleton<CompletePatientRegisterationUsecase>(CompletePatientRegisterationUsecase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());

}