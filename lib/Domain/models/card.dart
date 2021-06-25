class Cardd {
  String cvv;
  String number;
  String expiryMonth;
  String expiryYear;

  Cardd({this.cvv, this.number, this.expiryMonth, this.expiryYear});

  factory Cardd.fromJson(Map<String, dynamic> json) => Cardd(
        cvv: json['cvv'] as String,
        number: json['number'] as String,
        expiryMonth: json['expiry_month'] as String,
        expiryYear: json['expiry_year'] as String,
      );

  Map<String, dynamic> toJson() => {
        'cvv': cvv,
        'number': number,
        'expiry_month': expiryMonth,
        'expiry_year': expiryYear,
      };
}
