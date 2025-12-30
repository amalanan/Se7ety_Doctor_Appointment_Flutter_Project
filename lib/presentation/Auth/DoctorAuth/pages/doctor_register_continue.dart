import 'package:flutter/material.dart';
import 'package:se7ety_project/imports.dart';

class DoctorRegisterContinue extends StatefulWidget {
  DoctorRegisterContinue({super.key});

  @override
  State<DoctorRegisterContinue> createState() => _DoctorRegisterContinueState();
}

class _DoctorRegisterContinueState extends State<DoctorRegisterContinue> {
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

  final TextEditingController clinicAddressController = TextEditingController();

  final TextEditingController fromController = TextEditingController();

  final TextEditingController toController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? selectedSpecialization;

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

  Widget _buildDropdown() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          size: 30,
          color: AppColors.primary,
        ),
        isExpanded: true,
        dropdownColor: Colors.white,
        decoration: _buildDecoration(hint: ' '),
        hint: const Align(
          alignment: Alignment.topRight,
          child: Text('اختر تخصصك', style: TextStyle(color: Colors.black)),
        ),
        items: const [
          DropdownMenuItem(
            alignment: Alignment.topRight,
            value: 'دكتور عظام',
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'دكتور عظام',
                style: TextStyle(color: Colors.black, height: 0.4),
              ),
            ),
          ),
          DropdownMenuItem(
            alignment: Alignment.topRight,
            value: 'دكتور قلب',
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'دكتور قلب',
                style: TextStyle(color: Colors.black, height: 0.4),
              ),
            ),
          ),
        ],
        onChanged: (value) {
          selectedSpecialization = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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

                const SizedBox(height: 20),
                _buildTitle('التخصص'),
                const SizedBox(height: 10),
                _buildDropdown(),

                const SizedBox(height: 10),
                _buildTitle('العمر'),
                const SizedBox(height: 10),
                _buildTextField(controller: ageController, hint: '20'),
                const SizedBox(height: 10),
                _buildTitle('نبذة تعريفية'),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: bioController,
                  hint:
                      'سجل المعلومات الطبية العامة مقل تعليمك الأكاديمي وخبراتك السابقة..',
                  radius: 30,
                  maxLines: 6,
                  minLines: 4,
                ),

                const SizedBox(height: 10),
                _buildTitle('عنوان العيادة'),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: clinicAddressController,
                  hint: 'شارع الرشيد',
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                _buildTitle('المدينة'),
                const SizedBox(height: 10),
                _buildTextField(controller: cityController, hint: 'غزة'),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle('إلى:'),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: toController,
                            hint: '10:00 PM',
                            icon: Icons.watch_later_outlined,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle('ساعات العمل من:'),
                          const SizedBox(height: 10),
                          _buildTextField(
                            controller: fromController,
                            hint: '10:00 AM',
                            icon: Icons.watch_later_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

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
                    final request = CompleteDoctorRegisterationRequest(
                      city: cityController.text,
                      age: int.parse(ageController.text),
                      imageUrl: imageUrlController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                      clinicAddress: clinicAddressController.text,
                      specialization: selectedSpecialization ?? '',
                      // لازم يكون عندك controller
                      workingHoursFrom: fromController.text,
                      workingHoursTo: toController.text,
                    );

                    // استدعاء use case
                    var result = await sl<CompleteDoctorRegisterationUsecase>()
                        .call(params: request);

                    // التعامل مع النتيجة
                    result.fold(
                      (l) {
                        final snackbar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      (r) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => DoctorHomeScreen()),
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
