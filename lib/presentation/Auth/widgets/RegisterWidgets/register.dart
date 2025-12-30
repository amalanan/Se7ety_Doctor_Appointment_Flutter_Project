import '../../../../../imports.dart';

class Register extends StatelessWidget {
  Register({
    super.key,
    required this.roleText,
    required this.onSuccess,
    required this.onSignIn,
  });

  final VoidCallback onSuccess;
  final VoidCallback onSignIn;

  final TextEditingController _nameController = TextEditingController();
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
              const AuthLogo(),
              SizedBox(height: 30),
              AuthTitle('سجل حساب جديد كـ $roleText'),
              SizedBox(height: 30),
              AuthNameField(nameController: _nameController, context: context),
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
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<RegisterUseCase>().call(
                    params: CreateUserReq(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      role: roleText,
                    ),
                  );
                  result.fold(
                    (l) => ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l))),
                    (r) => onSuccess(),
                  );
                },
                circularBorder: 50,
                buttonText: 'تسجيل حساب',
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: onSignIn,
                    child: Text(
                      'سجل دخول',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Text('لديك حساب؟'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
