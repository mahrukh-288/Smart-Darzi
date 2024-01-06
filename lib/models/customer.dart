class Customer {
  String name;
  int phoneNumber;
  String familyName;
  String id = '';
  String length = '';
  String shoulder = '';
  String chest = '';
  String neck = '';
  String armLength = '';
  String armRound = '';
  String waist = '';
  String lap = '';
  String lengthOfTrouser = '';
  String ankleWidth = '';
  String hips = '';

  Customer(
      {required this.name,
      required this.phoneNumber,
      required this.familyName});

  Customer.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = json['_id'] as String,
        phoneNumber = json['phoneNumber'] as int,
        familyName = json['familyName'] as String,
        length = json['length'] as String,
        shoulder = json['shoulder'] as String,
        chest = json['chest'] as String,
        neck = json['neck'] as String,
        armLength = json['armLength'] as String,
        armRound = json['armRound'] as String,
        waist = json['waist'] as String,
        lap = json['lap'] as String,
        lengthOfTrouser = json['lengthOfTrouser'] as String,
        ankleWidth = json['ankleWidth'] as String,
        hips = json['hips'] as String;

  Map<String, dynamic> toJson() =>
      {'name': name, 'phoneNumber': phoneNumber, 'familyName': familyName,
       'length': length, 'shoulder': shoulder, 'chest' : chest
      , 'neck': neck, 'armLength': armLength, 'armRound' : armRound
      , 'waist': waist, 'lap': lap, 'lengthOfTrouser' : lengthOfTrouser
      , 'ankleWidth': ankleWidth, 'hips': hips
      };
}
