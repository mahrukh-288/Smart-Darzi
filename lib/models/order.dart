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
String orderCategory = '';
String orderType = '';
String id = '';
String orderStatus = 'inactive';
String lapStyle = '';
String pantStyle = '';

Order();

Order.fromJson(Map<String, dynamic> json)
      : customerId = json['customerId'] as String,
      id = json['_id'] as String,
        cuffStyle = json['cuffStyle'] as String,
        neckStyle = json['neckStyle'] as String,
         orderCategory = json['orderCategory'] as String,
        orderType = json['orderType'] as String,
        buttonStyle = json['buttonStyle'] as String,
        pocketStyle = json['pocketStyle'] as String,
        elastic = json['elastic'] as String,
        embroidery = json['embroidery'] as String,
        embroidaryStyle = json['style'] as String,
        bookNumber = json['bookNumber'] as int,
        designNumber = json['designNumber'] as int,
        lapStyle = json['lapStyle'] as String,
        pantStyle = json['pantStyle'] as String,
        orderStatus = json['orderStatus'] as String;

        

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'cuffStyle': cuffStyle,
        'orderType' : orderType,
        'orderCategory' : orderCategory,
        'neckStyle' : neckStyle,
        'buttonStyle' : buttonStyle,
        'pocketStyle' : pocketStyle,
        'elastic' : elastic,
        'embroidery' : embroidery,
        'style' : embroidaryStyle,
        'bookNumber' : bookNumber,
        'designNumber' : designNumber,
        'lapStyle' : lapStyle,
        'pantStyle' : pantStyle,
      
      };

}