class SizeModel{
String customerId = '';
String length = '1';
String shoulder = '1';
String chest = '1';
String neck = '1';
String armLength = '1';
String armRound = '1';
String waist = '1';
String lap = '1';
String lengthOfTrouser = '1';
String ankleWidth = '1';
String hips = '1';
String shoulderLength = '1';

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
        hips = json['hips'] as String;

  Map<String, dynamic> toJson() {
    return {'customerId': customerId, 'length': length, 'shoulder': shoulder, 'chest' : chest
      , 'neck': neck, 'armLength': armLength, 'armRound' : armRound
      , 'waist': waist, 'lap': lap, 'lengthOfTrouser' : lengthOfTrouser
      , 'ankleWidth': ankleWidth, 'hips': hips};
  }


}