import 'package:flutter/material.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(AppColors.primary),
      ),
    );
  }
}
