import 'package:flutter/material.dart';

import 'package:medlife_v2/ui/resources/text_styles.dart';

class SummeryRow extends StatelessWidget {
  final String text;
  final String price;

  const SummeryRow({required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: text == "Total"
              ? openSans16W500(color: const Color(0xff1A1A1A))
              : openSans14W400(color: const Color(0xff1A1A1A).withOpacity(0.6)),
        ),
        const Spacer(),
        Text(
          price,
          style: text == "Total"
              ? openSans24W600(color: const Color(0xff1A1A1A))
              : openSans14W400(color: const Color(0xff1A1A1A)),
        ),
      ],
    );
  }
}
