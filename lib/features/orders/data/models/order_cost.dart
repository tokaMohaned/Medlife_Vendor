class OrderCost {
  final double deliveryFee;
  final double discount;
  final double shipping;
  final double total;

  OrderCost({
    required this.deliveryFee,
    required this.discount,
    required this.shipping,
    required this.total,
  });

  OrderCost.fromJson(Map<String, dynamic> json)
      : this(
          deliveryFee: json['deliveryFee'] as double,
          discount: json['discount'] as double,
          shipping: json['shipping'] as double,
          total: json['total'] as double,
        );

  Map<String, dynamic> toJson() {
    return {
      'deliveryFee': deliveryFee,
      'discount': discount,
      'shipping': shipping,
      'total': total,
    };
  }
}
