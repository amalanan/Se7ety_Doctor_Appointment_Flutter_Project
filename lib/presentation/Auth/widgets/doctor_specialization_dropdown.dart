import '../../../imports.dart';

class DoctorSpecializationDropdown extends StatelessWidget {
  const DoctorSpecializationDropdown({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blue.withOpacity(0.09),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          size: 30,
          color: AppColors.primary,
        ),
        hint: const Align(
          alignment: Alignment.topRight,
          child: Text('اختر تخصصك'),
        ),
        items: const [
          DropdownMenuItem(
            value: 'دكتور عظام',
            child: Text('دكتور عظام'),
          ),
          DropdownMenuItem(
            value: 'دكتور قلب',
            child: Text('دكتور قلب'),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
