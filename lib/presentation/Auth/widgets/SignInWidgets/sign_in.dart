import '../../../../../imports.dart';

class SignIn extends StatelessWidget {
  SignIn({
    super.key,
    required this.roleText,
    required this.onSuccess,
    required this.onRegister,
  });

  final VoidCallback onSuccess;
  final VoidCallback onRegister;

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
              AuthLogo(),
              SizedBox(height: 30),
              AuthTitle('سجل دخول الان كـ $roleText'),
              SizedBox(height: 30),
              AuthEmailTextField(
                emailController: _emailController,
                context: context,
              ),
              SizedBox(height: 30),
              AuthPasswordTextField(
                passwordController: _passwordController,
                context: context,
              ),
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
                  result.fold((l) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l)));
                  }, (r) => onSuccess());
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
                    onPressed: onRegister,
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
}
