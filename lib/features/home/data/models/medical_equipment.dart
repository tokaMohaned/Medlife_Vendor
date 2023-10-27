import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalEquipment {
  String id;
  final String title;
  final String description;
  final double price;
  final double quantity;
  final double rating;
  List<String> imagesUrls;
  final String sellerName;
  final String brandName;
  final String productType;
  final double sellerRating;
  final int numOfReviews;
  final DateTime createdAt;

  MedicalEquipment({
    this.id = '',
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    this.rating = 5.0,
    required this.imagesUrls,
    required this.sellerName,
    required this.brandName,
    required this.productType,
    this.sellerRating = 4.8,
    this.numOfReviews = 45,
    required this.createdAt,
  });

  MedicalEquipment.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          price: json['price'] as double,
          quantity: json['quantity'] as double,
          rating: (json['rating'] as num).toDouble(),
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          sellerName: json['sellerName'] as String,
          brandName: json['brandName'] as String,
          productType: json['productType'] as String,
          sellerRating: json['sellerRating'] as double,
          numOfReviews: json['numOfReviews'] as int,
          createdAt: (json['createdAt'] as Timestamp).toDate(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'quantity': quantity,
        'rating': rating,
        'imagesUrls': imagesUrls,
        'sellerName': sellerName,
        'sellerRating': sellerRating,
        'brandName': brandName,
        'productType': productType,
        'numOfReviews': numOfReviews,
        'createdAt': createdAt,
      };
}
