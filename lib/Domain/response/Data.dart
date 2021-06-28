
import 'Authorization.dart';
import 'Customer.dart';
import 'Metadata.dart';

class Data {
    int amount;
    Authorization authorization;
    String channel;
    String createdAt;
    String created_at;
    String currency;
    Customer customer;
    String domain;
    int fees;
    String gateway_response;
    int id;
    String ip_address;
    Object log;
    String message;
    Metadata metadata;
    Object order_id;
    String paidAt;
    String paid_at;
    Object plan;
    Object pos_transaction_data;
    String reference;
    int requested_amount;
    Object source;
    String status;
    String transaction_date;

    Data({this.amount, this.authorization, this.channel, this.createdAt, this.created_at, this.currency, this.customer, this.domain, this.fees, this.gateway_response, this.id, this.ip_address, this.log, this.message, this.metadata, this.order_id, this.paidAt, this.paid_at, this.plan, this.pos_transaction_data, this.reference, this.requested_amount, this.source,this.status, this.transaction_date});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            amount: json['amount'], 
            authorization: json['authorization'] != null ? Authorization.fromJson(json['authorization']) : null, 
            channel: json['channel'], 
            createdAt: json['createdAt'], 
            created_at: json['created_at'], 
            currency: json['currency'], 
            customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null, 
            domain: json['domain'], 
            fees: json['fees'], 
            //fees_split: json['fees_split'] != null ? Object.fromJson(json['fees_split']) : null,
            gateway_response: json['gateway_response'], 
            id: json['id'], 
            ip_address: json['ip_address'],
            //message: json['message'] != null ? Object.fromJson(json['message']) : null,
            metadata: json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null, 
            //order_id: json['order_id'] != null ? Object.fromJson(json['order_id']) : null,
            paidAt: json['paidAt'], 
            paid_at: json['paid_at'], 
            reference: json['reference'],
            requested_amount: json['requested_amount'],
            status: json['status'], 
            transaction_date: json['transaction_date'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['channel'] = this.channel;
        data['createdAt'] = this.createdAt;
        data['created_at'] = this.created_at;
        data['currency'] = this.currency;
        data['domain'] = this.domain;
        data['fees'] = this.fees;
        data['gateway_response'] = this.gateway_response;
        data['id'] = this.id;
        data['ip_address'] = this.ip_address;
        data['paidAt'] = this.paidAt;
        data['paid_at'] = this.paid_at;
        data['reference'] = this.reference;
        data['requested_amount'] = this.requested_amount;
        data['status'] = this.status;
        data['transaction_date'] = this.transaction_date;
        if (this.authorization != null) {
            data['authorization'] = this.authorization.toJson();
        }
        if (this.customer != null) {
            data['customer'] = this.customer.toJson();
        }
        if (this.metadata != null) {
            data['metadata'] = this.metadata.toJson();
        }

        return data;
    }
}