import '../../../../../imports.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'صــحّتـي',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      leading: const Icon(
        Icons.notifications_active,
        color: Colors.black,
        size: 28,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
