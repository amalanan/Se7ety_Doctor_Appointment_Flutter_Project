import '../../../../imports.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    required this.trailing,
    this.icon,
    this.title,
    super.key,
    this.leading,
    this.onTap,
  });

  final IconData? icon;
  final String? title;
  final Widget trailing;
  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(0.09),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 11),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: leading ?? Icon(icon),
            title: Text(
              title ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
