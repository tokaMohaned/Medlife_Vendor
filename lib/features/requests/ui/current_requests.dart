import 'package:flutter/material.dart';
import 'package:medlife_v2/features/requests/widgets/current_requests_list.dart';

class CurrentRequests extends StatelessWidget {
  const CurrentRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const CurrentRequestsList(),
        ],
      ),
    );
  }
}
