class Customer {
  String name = '0';
  int phoneNumber = 0;
  String familyName = '0';
  String id = '0';


  Customer(
      );

  Customer.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = json['_id'] as String,
        phoneNumber = json['phoneNumber'] as int,
        familyName = json['familyName'] as String;
        

  Map<String, dynamic> toJson() =>
      {'name': name, 'phoneNumber': phoneNumber, 'familyName': familyName,
       
      };
}
