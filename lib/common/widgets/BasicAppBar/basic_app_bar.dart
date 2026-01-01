import '../../../imports.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar(
      {this.onTrailingPressed, this.onLeadingPressed, this.trailingIcon, this.icon, super.key, required this.appTitle});

  final String appTitle;
  final IconData? icon;
  final IconData? trailingIcon;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTrailingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [IconButton(onPressed: onTrailingPressed,
          icon: Icon(trailingIcon, color: Colors.white))
      ],
      leading: IconButton(
          onPressed: onLeadingPressed, icon: Icon(icon, color: Colors.white)),
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(appTitle, style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
