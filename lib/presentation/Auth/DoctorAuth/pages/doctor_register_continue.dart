import 'package:flutter/material.dart';
import 'package:se7ety_project/imports.dart';

class DoctorRegisterContinue extends StatelessWidget {
  DoctorRegisterContinue({super.key});

  TextEditingController bioController = TextEditingController();
  TextEditingController clinicAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  child: Image.asset(AppImages.splashLogo),
                ),
                SizedBox(height: 20),
                Align(alignment: Alignment.topRight, child: Text('التخصص')),
                SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      size: 30,
                      color: AppColors.primary,
                    ),
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.09),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    hint: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'اختر تخصصك',
                        style: TextStyle(color: Colors.black),
                      ),
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
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('نبذة تعريفية'),
                ),
                SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 4,
                    textAlignVertical: TextAlignVertical.top,
                    controller: bioController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText:
                      'سجل المعلومات الطبية العامة مقل تعليمك الأكاديمي وخبراتك السابقة..',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.09),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('عنوان العيادة'),
                ),
                SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: clinicAddressController,
                    decoration: InputDecoration(
                      hintText: 'شارع الرشيد',
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(color: Colors.grey),
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
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text('إلى:'),
                          ),
                          SizedBox(height: 10),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: clinicAddressController,
                              decoration: InputDecoration(
                                hintText: '10:00 PM',
                                hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.watch_later_outlined,
                                    color: AppColors.primary,
                                    size: 30,
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text('ساعات العمل من:'),
                          ),
                          SizedBox(height: 10),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: clinicAddressController,
                              decoration: InputDecoration(
                                hintText: '10:00 AM',
                                hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.watch_later_outlined,
                                    color: AppColors.primary,
                                    size: 30,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('رقم الهاتف '),
                ),
                SizedBox(height: 10),

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: clinicAddressController,
                    decoration: InputDecoration(
                      hintText: '*******970+',
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(color: Colors.grey),
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
                ),
                SizedBox(height: 30),
                BasicAppButton(
                  buttonText: 'التسجيل',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext contex) {
                          return DoctorHomeScreen();
                        },
                      ),
                    );
                  },
                  circularBorder: 20,
                  horizontalSymmetric: 160,
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
