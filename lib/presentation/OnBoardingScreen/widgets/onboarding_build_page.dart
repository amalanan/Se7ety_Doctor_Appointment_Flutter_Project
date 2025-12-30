import '../../../imports.dart';

class OnBoardingBuildPage extends StatelessWidget {
  const OnBoardingBuildPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image, height: 350),
          SizedBox(height: 70),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: AppColors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
