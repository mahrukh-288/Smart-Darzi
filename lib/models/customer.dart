class Customer {
  String name = '0';
  int phoneNumber = 0;
  String familyName = '0';
  String id = '0';
  String length = '0';
  String shoulder = '0';
  String chest = '0';
  String neck = '0';
  String armLength = '0';
  String armRound = '0';
  String waist = '0';
  String lap = '0';
  String lengthOfTrouser = '0';
  String ankleWidth = '0';
  String hips = '0';

  Customer(
      );

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
