import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/new_orders_list.dart';

class NewOrders extends StatelessWidget {
  const NewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          NewOrdersList(),
        ],
      ),
    );
  }
}
