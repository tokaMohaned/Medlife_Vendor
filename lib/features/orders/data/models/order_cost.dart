class OrderCost {
  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double taxes;
  late final double total = subtotal + deliveryFee + taxes;

  OrderCost({
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.taxes,
  });

  OrderCost.fromJson(Map<String, dynamic> json)
      : this(
          subtotal: (json['subtotal'] as num).toDouble(),
          deliveryFee: (json['deliveryFee'] as num).toDouble(),
          discount: (json['discount'] as num).toDouble(),
          taxes: (json['taxes'] as num).toDouble(),
        );
}
