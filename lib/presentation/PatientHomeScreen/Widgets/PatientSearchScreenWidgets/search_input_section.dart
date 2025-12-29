import '../../../../imports.dart';

class SearchInputSection extends StatelessWidget {
  const SearchInputSection({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 30),
      child: SearchTextField(
        searchController: searchController,
        hintText: 'البحث',
        iconColor: Colors.white,
        searchColor: AppColors.primary,
        onSubmitted: (value) {
          final query = value.trim();
          context.read<SearchScreenCubit>().searchDoctors(query);
        },
        onPressed: () {
          final query = searchController.text.trim();
          if (query.isEmpty) return;
          context.read<SearchScreenCubit>().searchDoctors(query);
        },
      ),
    );
  }
}
