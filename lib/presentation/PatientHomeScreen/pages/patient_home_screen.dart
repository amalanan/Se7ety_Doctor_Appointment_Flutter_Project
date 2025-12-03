import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../imports.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  TextEditingController searchController = TextEditingController();

  Future<String> getUserName() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final snapshot =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    return snapshot['name'];
  }

  String userName = "";

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    String name = await getUserName();
    setState(() {
      userName = name;
    });
  }

  List<Widget> doctorCards = [
    doctorCard(
      cardColor: Colors.blueAccent.shade100,
      specialization: 'جراحة عامة',
    ),
    doctorCard(cardColor: Colors.green.shade200, specialization: 'دكتور قلب'),
    doctorCard(cardColor: Colors.orange.shade100, specialization: 'دكتور عظام'),
    doctorCard(
      cardColor: Colors.blueGrey.shade100,
      specialization: 'دكتور جلدية',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'صــحّتـي',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.notifications_active,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Text('مرحبا,', style: TextStyle(fontSize: 18)),
                        Text(
                          '$userName ' + 'أمل',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'احجز الان وكن جزءا من رحلتك الصحية.',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _searchField(context),
                  SizedBox(height: 20),
                  Text(
                    'التخصصات',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 270,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: doctorCards.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [doctorCards[index], SizedBox(width: 20)],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'الأعلى تقييما',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Icon(Icons.star, color: Colors.orange),
                      ),
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(AppImages.splashLogo),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(
                        'علي  بن خالد ',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'جراحة عامة',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return TextField(
      controller: searchController,
      // keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'ابحث عن دكتور',
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Icon(Icons.search, color: Colors.white, size: 30),
        ),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.09),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class doctorCard extends StatelessWidget {
  doctorCard({
    super.key,
    required this.cardColor,
    required this.specialization,
  });

  String specialization;
  Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 200,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(AppImages.doctorCard),
          SizedBox(height: 10),
          Text(
            specialization,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
