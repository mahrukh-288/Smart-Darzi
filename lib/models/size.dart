class SizeModel{
String customerId = '0';
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
String shoulderLength = '0';
String armscye = '0';

SizeModel();

SizeModel.fromJson(Map<String, dynamic> json)
      : customerId = json['customerId'] as String,
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
        hips = json['hips'] as String,
        armscye = json['armscye'] as String;

  Map<String, dynamic> toJson() {
    return {'customerId': customerId, 'length': length, 'shoulder': shoulder, 'chest' : chest
      , 'neck': neck, 'armLength': armLength, 'armRound' : armRound
      , 'waist': waist, 'lap': lap, 'lengthOfTrouser' : lengthOfTrouser
      , 'ankleWidth': ankleWidth, 'hips': hips, 'armscye':armscye};
  }


}