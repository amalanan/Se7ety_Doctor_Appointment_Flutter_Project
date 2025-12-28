import '../../../imports.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  BasicAppBar({super.key, required this.appTitle});

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(appTitle, style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
