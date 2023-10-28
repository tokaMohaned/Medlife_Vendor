import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/completed_requests_list.dart';

class CompletedRequests extends StatelessWidget {
  const CompletedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          CompletedRequestsList(),
        ],
      ),
    );
  }
}
