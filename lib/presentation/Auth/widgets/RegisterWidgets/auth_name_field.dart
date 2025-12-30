import '../../../../imports.dart';

class AuthNameField extends StatelessWidget {
  const AuthNameField({
    super.key,
    required TextEditingController nameController,
    required this.context,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      // keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Sayed',
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(Icons.person, color: AppColors.primary, size: 30),
        ),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.09),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
