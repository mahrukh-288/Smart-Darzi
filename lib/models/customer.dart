class Customer {
  String name;
  String phoneNumber;
  String familyName;

  Customer(
      {required this.name,
      required this.phoneNumber,
      required this.familyName});

  Customer.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        phoneNumber = json['phoneNumber'] as String,
        familyName = json['familyName'] as String;

  Map<String, dynamic> toJson() =>
      {'name': name, 'phoneNumber': phoneNumber, 'familyName': familyName};
}
