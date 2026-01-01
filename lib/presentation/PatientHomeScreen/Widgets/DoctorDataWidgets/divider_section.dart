import '../../../../imports.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 330,
        child: const Divider(thickness: 1.1, color: Colors.grey),
      ),
    );
  }
}
