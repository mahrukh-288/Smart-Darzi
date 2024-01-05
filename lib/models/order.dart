class Order{
String customerId = '';
String cuffStyle = '';
String neckStyle = '';
String buttonStyle = '';
String pocketStyle = '';
String elastic = '';
String embroidery = '';
String embroidaryStyle = '';
int bookNumber = 0;
int designNumber = 0;

Order();

Order.fromJson(Map<String, dynamic> json)
      : customerId = json['customerId'] as String,
        cuffStyle = json['cuffStyle'] as String,
        neckStyle = json['neckStyle'] as String,
        buttonStyle = json['buttonStyle'] as String,
        pocketStyle = json['pocketStyle'] as String,
        elastic = json['elastic'] as String,
        embroidery = json['embroidery'] as String,
        embroidaryStyle = json['style'] as String,
        bookNumber = json['bookNumber'] as int,
        designNumber = json['designNumber'] as int;

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'cuffStyle': cuffStyle,
        'neckStyle' : neckStyle,
        'buttonStyle' : buttonStyle,
        'pocketStyle' : pocketStyle,
        'elastic' : elastic,
        'embroidery' : embroidery,
        'style' : embroidaryStyle,
        'bookNumber' : bookNumber,
        'designNumber' : designNumber,
      };

}