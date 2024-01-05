class Customer {
  String name;
  int phoneNumber;
  String familyName;
  String id = '';
//   String? length;
// String? shoulder;
// String? chest ;
// String? neck;
// String? armLength ;
// String? armRound;
// String? waist ;
// String? lap ;
// String? lengthOfTrouser;
// String? ankleWidth;
// String? hips;

  Customer(
      {required this.name,
      required this.phoneNumber,
      required this.familyName});

  Customer.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
      id = json['_id'] as String,
        phoneNumber = json['phoneNumber'] as int,
        familyName = json['familyName'] as String
       
        ;

  Map<String, dynamic> toJson() =>
      {'name': name, 'phoneNumber': phoneNumber, 'familyName': familyName
      };
}
