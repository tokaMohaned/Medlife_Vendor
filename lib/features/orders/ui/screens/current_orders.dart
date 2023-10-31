import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/current_orders_list.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          CurrentOrdersList(),
        ],
      ),
    );
  }
}
