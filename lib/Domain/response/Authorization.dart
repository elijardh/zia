class Authorization {
    String account_name;
    String authorization_code;
    String bank;
    String bin;
    String brand;
    String card_type;
    String channel;
    String country_code;
    String exp_month;
    String exp_year;
    String last4;
    String receiver_bank;
    String receiver_bank_account_number;
    bool reusable;
    String signature;

    Authorization({this.account_name, this.authorization_code, this.bank, this.bin, this.brand, this.card_type, this.channel, this.country_code, this.exp_month, this.exp_year, this.last4, this.receiver_bank, this.receiver_bank_account_number, this.reusable, this.signature});

    factory Authorization.fromJson(Map<String, dynamic> json) {
        return Authorization(
            account_name: json['account_name'] != null ? json['account_name'] : null,
            authorization_code: json['authorization_code'], 
            bank: json['bank'], 
            bin: json['bin'], 
            brand: json['brand'], 
            card_type: json['card_type'], 
            channel: json['channel'], 
            country_code: json['country_code'], 
            exp_month: json['exp_month'], 
            exp_year: json['exp_year'], 
            last4: json['last4'], 
            receiver_bank: json['receiver_bank'] != null ? json['receiver_bank'] : "",
            receiver_bank_account_number: json['receiver_bank_account_number'] != null ? json['receiver_bank_account_number'] : "",
            reusable: json['reusable'], 
            signature: json['signature'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['authorization_code'] = this.authorization_code;
        data['bank'] = this.bank;
        data['bin'] = this.bin;
        data['brand'] = this.brand;
        data['card_type'] = this.card_type;
        data['channel'] = this.channel;
        data['country_code'] = this.country_code;
        data['exp_month'] = this.exp_month;
        data['exp_year'] = this.exp_year;
        data['last4'] = this.last4;
        data['reusable'] = this.reusable;
        data['signature'] = this.signature;
        if (this.account_name != null) {
            data['account_name'] = this.account_name;
        }
        if (this.receiver_bank != null) {
            data['receiver_bank'] = this.receiver_bank;
        }
        if (this.receiver_bank_account_number != null) {
            data['receiver_bank_account_number'] = this.receiver_bank_account_number;
        }
        return data;
    }
}