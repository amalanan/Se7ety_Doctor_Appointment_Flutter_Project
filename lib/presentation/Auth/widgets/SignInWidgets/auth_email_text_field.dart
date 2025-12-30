
import '../../../../imports.dart';

class AuthEmailTextField extends StatelessWidget {
  const AuthEmailTextField({
    super.key,
    required TextEditingController emailController,
    required this.context,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Sayed@example.com',
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(Icons.email, color: AppColors.primary, size: 30),
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

