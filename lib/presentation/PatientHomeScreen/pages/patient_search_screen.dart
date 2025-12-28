import 'package:flutter/material.dart';
import 'package:se7ety_project/common/widgets/BasicAppBar/basic_app_bar.dart';

class PatientSearchScreen extends StatelessWidget {
  const  PatientSearchScreen({super.key, required this.initialQuery});
  final String initialQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(appTitle: 'ابحث عن دكتور'),
      body: Center(
        child: Text('بحث عن: $initialQuery'),
      ),
    );
  }
}
