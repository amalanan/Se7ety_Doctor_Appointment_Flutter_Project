
import '../../../imports.dart';

class DoctorDataScreen extends StatelessWidget {
  const DoctorDataScreen({super.key, required this.doctor});

  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BasicAppBar(
          appTitle: 'بيانات الدكتور',
          icon: Icons.arrow_back_ios,
          onLeadingPressed: () => Navigator.of(context).pop(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoctorHeaderSection(doctor: doctor),
                const SizedBox(height: 20),
                DoctorBioSection(doctor: doctor),
                const SizedBox(height: 10),
                DoctorClinicSection(doctor: doctor),
                const SizedBox(height: 2),
                DividerSection(),
                const SizedBox(height: 40),
                Text(
                  'معلومات الاتصال',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                DoctorContactSection(doctor: doctor),
                SizedBox(height: 80),
                BookAppointmentButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
