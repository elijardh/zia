class Authorization {
  String authorizationCode;
  String bin;
  String last4;
  String expMonth;
  String expYear;
  String channel;
  String cardType;
  String bank;
  String countryCode;
  String brand;
  bool reusable;
  String signature;
  dynamic accountName;
  dynamic receiverBankAccountNumber;
  dynamic receiverBank;

  Authorization({
    this.authorizationCode,
    this.bin,
    this.last4,
    this.expMonth,
    this.expYear,
    this.channel,
    this.cardType,
    this.bank,
    this.countryCode,
    this.brand,
    this.reusable,
    this.signature,
    this.accountName,
    this.receiverBankAccountNumber,
    this.receiverBank,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        authorizationCode: json['authorization_code'] as String,
        bin: json['bin'] as String,
        last4: json['last4'] as String,
        expMonth: json['exp_month'] as String,
        expYear: json['exp_year'] as String,
        channel: json['channel'] as String,
        cardType: json['card_type'] as String,
        bank: json['bank'] as String,
        countryCode: json['country_code'] as String,
        brand: json['brand'] as String,
        reusable: json['reusable'] as bool,
        signature: json['signature'] as String,
        accountName: json['account_name'],
        receiverBankAccountNumber: json['receiver_bank_account_number'],
        receiverBank: json['receiver_bank'],
      );

  Map<String, dynamic> toJson() => {
        'authorization_code': authorizationCode,
        'bin': bin,
        'last4': last4,
        'exp_month': expMonth,
        'exp_year': expYear,
        'channel': channel,
        'card_type': cardType,
        'bank': bank,
        'country_code': countryCode,
        'brand': brand,
        'reusable': reusable,
        'signature': signature,
        'account_name': accountName,
        'receiver_bank_account_number': receiverBankAccountNumber,
        'receiver_bank': receiverBank,
      };
}
