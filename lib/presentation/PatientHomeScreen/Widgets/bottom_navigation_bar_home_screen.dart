import '../../../imports.dart';

class BottomNavigationBarHomeScreen extends StatelessWidget {
  const BottomNavigationBarHomeScreen({
    super.key,
    required this.searchController,
    required this.context,
    required this.icon,
    required this.label,
    required this.index,
    required this.state,
  });

  final TextEditingController searchController;
  final BuildContext context;
  final IconData icon;
  final String label;
  final int index;
  final PatientHomeLoaded state;

  @override
  Widget build(BuildContext context) {
    final isSelected = state.currentIndex == index;

    return GestureDetector(
      onTap: () {
        // أولاً نمسح البحث
        searchController.clear();
        context.read<SearchScreenCubit>().clearSearch();

        // بعدين نغيّر التاب
        context.read<PatientHomeCubit>().changeBottomNav(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 26,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
