import 'package:flutter/material.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.error,
      color: AppColors.primary,
      size: 40,
    );
  }
}
