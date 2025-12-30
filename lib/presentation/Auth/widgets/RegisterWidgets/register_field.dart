import '../../../../imports.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.icon,
  });

  final String title;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            suffixIcon:
                icon != null ? Icon(icon, color: AppColors.primary) : null,

            fillColor: Colors.blue.withOpacity(0.09),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
