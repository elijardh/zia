class Customer {
  int id;
  dynamic firstName;
  dynamic lastName;
  String email;
  String customerCode;
  dynamic phone;
  dynamic metadata;
  String riskAction;
  dynamic internationalFormatPhone;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.customerCode,
    this.phone,
    this.metadata,
    this.riskAction,
    this.internationalFormatPhone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as int,
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'] as String,
        customerCode: json['customer_code'] as String,
        phone: json['phone'],
        metadata: json['metadata'],
        riskAction: json['risk_action'] as String,
        internationalFormatPhone: json['international_format_phone'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'customer_code': customerCode,
        'phone': phone,
        'metadata': metadata,
        'risk_action': riskAction,
        'international_format_phone': internationalFormatPhone,
      };
}
