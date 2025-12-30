import '../../../../imports.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      reverse: true,
      controller: controller,
      children: const [
        OnBoardingBuildPage(
          image: AppImages.onBoarding1,
          title: "ابحث عن أي دكتور متخصص",
          subtitle:
          "اكتشف مجموعة واسعة من الأطباء و الخبرات و المتخصصين في مختلف المجالات",
        ),
        OnBoardingBuildPage(
          image: AppImages.onBoarding3,
          title: "سهولة الحجز",
          subtitle: "احجز المواعيد بضغطة زر في أي وقت وفي أي مكان",
        ),
        OnBoardingBuildPage(
          image: AppImages.onBoarding2,
          title: "امن و سري",
          subtitle: "كن مطمئنا لأن خصوصياتك و أمانك هما أهم أولوياتنا",
        ),
      ],
    );
  }
}
