import '../../../imports.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({this.icon, super.key, required this.appTitle});

  final String appTitle;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icon,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(appTitle, style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
