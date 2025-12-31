import 'imports.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final snapshot =
      await FirebaseFirestore.instance.collection('se7ety_users').get();
  print('Se7ety users count: ${snapshot.docs.length}');
  print(FirebaseAuth.instance.currentUser?.displayName);

  await initializeDependencies();
  runApp(
    DevicePreview(
      enabled: true, // خليها false لو بدك تطفئيها
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}
