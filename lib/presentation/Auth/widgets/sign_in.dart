import 'package:flutter/material.dart';
import '../../../../imports.dart';

class SignIn extends StatelessWidget {
  SignIn({
    super.key,
    required this.roleText,
    required this.homeNavigationButton,
    required this.onPressedRegisterButton,
  });

  final VoidCallback homeNavigationButton;
  final VoidCallback onPressedRegisterButton;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String roleText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(AppImages.splashLogo),
              ),
              SizedBox(height: 30),
              Text(
                'سجل دخول الان كـ ' + '$roleText',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              _emailField(context),
              SizedBox(height: 30),
              _passwordField(context),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Text('نسيت كلمة السر؟'),
              ),
              SizedBox(height: 20),
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<SignInUseCase>().call(
                    params: SignInUserReq(
                      email: _emailController.text,
                      password: _passwordController.text,
                      role: roleText,
                    ),
                  );
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      homeNavigationButton();
                    },
                  );
                },
                circularBorder: 50,
                buttonText: 'تسجيل الدخول',
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: onPressedRegisterButton,
                    child: Text(
                      'سجل الان',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Text('ليس لديك حساب؟'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
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

  Widget _passwordField(BuildContext context) {
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
