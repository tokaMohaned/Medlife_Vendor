import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/new_requests_list.dart';

class NewRequests extends StatelessWidget {
  const NewRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          NewRequestsList(),
        ],
      ),
    );
  }
}
