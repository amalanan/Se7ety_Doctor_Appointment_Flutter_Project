import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety_project/imports.dart';

import '../../../PatientHomeScreen/bloc/patient_home_cubit.dart';

class PatientRegisterContinue extends StatefulWidget {
  PatientRegisterContinue({super.key});

  @override
  State<PatientRegisterContinue> createState() =>
      _PatientRegisterContinueState();
}

class _PatientRegisterContinueState extends State<PatientRegisterContinue> {
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    imageUrlController.addListener(() {
      setState(() {
        profileImageUrl = imageUrlController.text;
      });
    });
  }

  final TextEditingController bioController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  InputDecoration _buildDecoration({
    required String hint,
    IconData? icon,
    double radius = 50,
  }) {
    return InputDecoration(
      hintText: hint,
      hintTextDirection: TextDirection.rtl,
      hintStyle: const TextStyle(color: Colors.grey),
      suffixIcon:
          icon != null
              ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(icon, color: AppColors.primary, size: 30),
              )
              : null,
      filled: true,
      fillColor: Colors.blue.withOpacity(0.09),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Align(alignment: Alignment.topRight, child: Text(text));
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int radius = 50,
    int? maxLines,
    int? minLines,
    IconData? icon,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: controller,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        textAlign: TextAlign.right,
        // مهم للنص العربي
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.text,
        // بدل emailAddress
        decoration: _buildDecoration(
          hint: hint,
          icon: icon,
          radius: radius.toDouble(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'إكمال عملية التسجيل',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage:
                      (profileImageUrl != null && profileImageUrl!.isNotEmpty)
                          ? NetworkImage(profileImageUrl!)
                          : const AssetImage(AppImages.splashLogo)
                              as ImageProvider,
                ),

                const SizedBox(height: 10),
                _buildTitle('العمر'),
                const SizedBox(height: 10),
                _buildTextField(controller: ageController, hint: '20'),
                const SizedBox(height: 10),
                _buildTitle('نبذة تعريفية'),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: bioController,
                  hint: 'اكتب معلومات عنك..',
                  radius: 30,
                  maxLines: 6,
                  minLines: 4,
                ),
                const SizedBox(height: 20),
                _buildTitle('المدينة'),
                const SizedBox(height: 10),
                _buildTextField(controller: cityController, hint: 'غزة'),

                const SizedBox(height: 10),
                _buildTitle('رقم الهاتف'),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: phoneController,
                  hint: '*******970+',
                ),
                const SizedBox(height: 10),
                _buildTitle('الصورة'),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: imageUrlController,
                  hint: 'أضف رابط الصورة الخاصة بك',
                ),
                const SizedBox(height: 30),

                BasicAppButton(
                  buttonText: 'التسجيل',
                  circularBorder: 50,
                  onPressed: () async {
                    // إنشاء request من الـ controllers
                    final request = CompletePatientRegisterationRequest(
                      city: cityController.text,
                      age: int.parse(ageController.text),
                      imageUrl: imageUrlController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                    );

                    var result = await sl<CompletePatientRegisterationUsecase>()
                        .call(params: request);

                    result.fold(
                      (l) {
                        final snackbar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      (r) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder :  (_) => BlocProvider(
                              create: (_) => PatientHomeCubit()..loadHomeData(),
                              child:  PatientHomeScreen(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
