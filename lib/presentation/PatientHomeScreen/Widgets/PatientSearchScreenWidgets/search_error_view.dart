import '../../../../imports.dart';

class SearchErrorView extends StatelessWidget {
  const SearchErrorView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          message,
          style: const TextStyle(color: AppColors.primary, fontSize: 18),
        ),
      ),
    );
  }
}
