class OrderCost {
  final double subtotal;
  final double shipping;
  final double vat;
  late final double total = subtotal + shipping + vat;

  OrderCost({
    required this.subtotal,
    required this.shipping,
    required this.vat,
  });

  OrderCost.fromJson(Map<String, dynamic> json)
      : this(
          subtotal: (json['subtotal'] as num).toDouble(),
          shipping: (json['shipping'] as num).toDouble(),
          vat: (json['vat'] as num).toDouble(),
        );
}
