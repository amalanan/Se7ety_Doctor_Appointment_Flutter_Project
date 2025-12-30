import '../../../../imports.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topRight, child: Text(text));
  }
}
