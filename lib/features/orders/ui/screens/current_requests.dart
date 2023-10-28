import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/current_requests_list.dart';

class CurrentRequests extends StatelessWidget {
  const CurrentRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          CurrentRequestsList(),
        ],
      ),
    );
  }
}
