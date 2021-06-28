import 'package:zia/Domain/models/metadata.dart';

class Customer {
    String customer_code;
    String email;
    String first_name;
    int id;

    String last_name;
    Metadata metadata;
    String phone;
    String risk_action;

    Customer({this.customer_code, this.email, this.first_name, this.id,this.last_name, this.metadata, this.phone, this.risk_action});

    factory Customer.fromJson(Map<String, dynamic> json) {
        return Customer(
            customer_code: json['customer_code'], 
            email: json['email'], 
            first_name: json['first_name'] != null ? json['first_name'] : "",
            id: json['id'],
            last_name: json['last_name'] != null ? json['last_name'] : "",
            metadata: json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
            phone: json['phone'] != null ? json['phone'] : "",
            risk_action: json['risk_action'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['customer_code'] = this.customer_code;
        data['email'] = this.email;
        data['id'] = this.id;
        data['risk_action'] = this.risk_action;
        if (this.first_name != null) {
            data['first_name'] = this.first_name;
        }
        if (this.last_name != null) {
            data['last_name'] = this.last_name;
        }
        if (this.metadata != null) {
            data['metadata'] = this.metadata.toJson();
        }
        if (this.phone != null) {
            data['phone'] = this.phone;
        }
        return data;
    }
}