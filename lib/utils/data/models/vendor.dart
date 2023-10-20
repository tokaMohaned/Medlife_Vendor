class Vendor {
  String? id;
  String? idNumber;
  String? crNumber;
  String? vatNumber;
  String? address;
  String? bankName;
  String? companyInsuranceName;
  String? firstName;
  String? lastName;
  String? email;
  String? ibanNumber;
  String? accountNumber;

  Vendor({
    required this.id,
    this.idNumber = '',
    this.crNumber = '',
    this.vatNumber = '',
    this.address = '',
    this.bankName = '',
    this.companyInsuranceName = '',
    this.ibanNumber = '',
    this.accountNumber = '',
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    firstName = json['firstName'] as String?;
    email = json['email'] as String?;
    idNumber = json['idNumber'] as String?;
    crNumber = json['crNumber'] as String?;
    vatNumber = json['vatNumber'] as String?;
    bankName = json['bankName'] as String?;
    address = json['address'] as String?;
    companyInsuranceName = json['companyInsuranceName'] as String?;
    lastName = json['secondName'] as String?;
    ibanNumber = json['ibanNumber'] as String?;
    accountNumber = json['accountNumber'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'idNumber': idNumber,
      'crNumber': crNumber,
      'vatNumber': vatNumber,
      'bankName': bankName,
      'address': address,
      'companyInsuranceName': companyInsuranceName,
      'secondName': lastName,
      'ibanNumber': ibanNumber,
      'accountNumber': accountNumber,
    };
  }
}
