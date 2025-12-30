import '../../../imports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OnBoardingHeader(),
          Expanded(
            child: OnBoardingPages(controller: _controller),
          ),
          OnBoardingFooter(controller: _controller),
        ],
      ),
    );
  }
}
