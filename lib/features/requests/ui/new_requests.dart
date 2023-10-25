import 'package:flutter/material.dart';
import 'package:medlife_v2/features/requests/widgets/new_requests_list.dart';

class NewRequests extends StatelessWidget {
  const NewRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const NewRequestsList(),
        ],
      ),
    );
  }
}
