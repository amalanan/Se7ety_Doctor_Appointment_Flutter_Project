import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety_project/common/widgets/BasicAppBar/basic_app_bar.dart';

import '../../../common/widgets/BasicAppButton/basic_app_button.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../data/models/user.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  const PatientAppointmentsScreen({super.key, this.doctor});

  final UserModel? doctor;

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BasicAppBar(appTitle: 'مواعيد الحجز'),
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance
                  .collection('se7ety_users')
                  .doc(uid)
                  .collection('bookings')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('لا يوجد مواعيد حتى الآن'));
            }

            final bookings = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];

                final doctorMap = booking['doctorName'] as Map<String, dynamic>?;
                final bookingDoctor =
                doctorMap != null ? UserModel.fromJson(doctorMap) : null;

                final date = booking['date'] ?? '';
                final time = booking['time'] ?? '';
                final patientName = booking['patientName'] ?? '';

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 25,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookingDoctor?.name ?? 'اسم الطبيب غير متوفر',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                size: 16,
                                Icons.calendar_month,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 10),
                              Text('$date', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 20),
                              Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                size: 16,
                                Icons.watch_later_outlined,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 10),
                              Text('$time', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'اسم المريض: $patientName',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                size: 16,
                                Icons.location_on,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 10),
                              Text(
                                bookingDoctor?.clinicAddress ??
                                    'عنوان العيادة غير متوفر',
                              ),                            ],
                          ),
                          const SizedBox(height: 15),
                          BasicAppButton(
                            horizontalSymmetric: 110,
                            verticalSymmetric: 10,
                            buttonText: 'حذف الحجز',
                            circularBorder: 12,
                            onPressed: () async {
                              try {
                                // حذف المستند (Booking) من Firebase
                                await FirebaseFirestore.instance
                                    .collection('se7ety_users')
                                    .doc(uid)
                                    .collection('bookings')
                                    .doc(booking.id) // id المستند
                                    .delete();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('تم حذف الحجز بنجاح'),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('حدث خطأ: $e')),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 10),

                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
