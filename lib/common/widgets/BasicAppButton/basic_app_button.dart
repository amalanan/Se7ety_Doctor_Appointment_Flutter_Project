import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';


class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.circularBorder,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final double circularBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorder),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}