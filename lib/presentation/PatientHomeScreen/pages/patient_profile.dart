import 'package:flutter/material.dart';
import 'package:se7ety_project/common/widgets/BasicAppBar/basic_app_bar.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BasicAppBar(appTitle: 'الحساب الشخصي'));
  }
}
