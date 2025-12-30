import '../../../../imports.dart';

class AuthPasswordTextField extends StatelessWidget {
  const AuthPasswordTextField({
    super.key,
    required TextEditingController passwordController,
    required this.context,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return StatefulBuilder(
      builder:
          (context, setState) => TextField(
            controller: _passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: '********',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.lock, color: AppColors.primary, size: 30),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primary,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.09),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
    );
  }
}
