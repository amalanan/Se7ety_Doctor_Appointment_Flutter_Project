import 'package:flutter/material.dart';
import 'package:se7ety_project/common/widgets/BasicAppBar/basic_app_bar.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  const  PatientAppointmentsScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(appTitle: 'حجز المواعيد')

    );
  }
}