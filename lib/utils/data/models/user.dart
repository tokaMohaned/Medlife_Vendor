import 'package:medlife_v2/utils/data/models/address.dart';

class User {
  String? id;
  String? idNumber;
  String? dateOfBirth;
  String? companyInsuranceName;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  Address? address;

  User({
    required this.id,
    this.idNumber = '',
    this.dateOfBirth = '',
    this.companyInsuranceName = '',
    this.phoneNumber = '',
    required this.firstName,
    required this.lastName,
    required this.email,
    this.address,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    firstName = json['firstName'] as String?;
    email = json['email'] as String?;
    idNumber = json['idNumber'] as String?;
    dateOfBirth = json['dateOfBirth'] as String?;
    companyInsuranceName = json['companyInsuranceName'] as String?;
    lastName = json['lastName'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    if (json['address'] != null) {
      address = Address.fromJson(json['address'] as Map<String, dynamic>);
    }
  }
}
