import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
