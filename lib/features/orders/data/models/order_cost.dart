class OrderCost {
  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double taxes;
  late final double total = subtotal + deliveryFee - discount + taxes;

  OrderCost({
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.taxes,
  });

  OrderCost.fromJson(Map<String, dynamic> json)
      : this(
          subtotal: json['subtotal'] as double,
          deliveryFee: json['deliveryFee'] as double,
          discount: json['discount'] as double,
          taxes: json['taxes'] as double,
        );
}
