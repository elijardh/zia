import 'authorization.dart';
import 'customer.dart';
import 'metadata.dart';

class Data {
  int id;
  String domain;
  String status;
  String reference;
  int amount;
  dynamic message;
  String gatewayResponse;
  String paidAt;
  String createdAt;
  String channel;
  String currency;
  String ipAddress;
  Metadata metadata;
  dynamic log;
  int fees;
  dynamic feesSplit;
  Authorization authorization;
  Customer customer;
  dynamic plan;
  dynamic orderId;
  int requestedAmount;
  dynamic posTransactionData;
  dynamic source;
  String transactionDate;

  Data({
    this.id,
    this.domain,
    this.status,
    this.reference,
    this.amount,
    this.message,
    this.gatewayResponse,
    this.paidAt,
    this.createdAt,
    this.channel,
    this.currency,
    this.ipAddress,
    this.metadata,
    this.log,
    this.fees,
    this.feesSplit,
    this.authorization,
    this.customer,
    this.plan,
    this.orderId,
    this.requestedAmount,
    this.posTransactionData,
    this.source,
    this.transactionDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int,
        domain: json['domain'] as String,
        status: json['status'] as String,
        reference: json['reference'] as String,
        amount: json['amount'] as int,
        message: json['message'],
        gatewayResponse: json['gateway_response'] as String,
        paidAt: json['paid_at'] as String,
        createdAt: json['created_at'] as String,
        channel: json['channel'] as String,
        currency: json['currency'] as String,
        ipAddress: json['ip_address'] as String,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        log: json['log'],
        fees: json['fees'] as int,
        feesSplit: json['fees_split'],
        authorization: json['authorization'] == null
            ? null
            : Authorization.fromJson(
                json['authorization'] as Map<String, dynamic>),
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
        plan: json['plan'],
        orderId: json['order_id'],
        requestedAmount: json['requested_amount'] as int,
        posTransactionData: json['pos_transaction_data'],
        source: json['source'],
        transactionDate: json['transaction_date'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'domain': domain,
        'status': status,
        'reference': reference,
        'amount': amount,
        'message': message,
        'gateway_response': gatewayResponse,
        'paid_at': paidAt,
        'created_at': createdAt,
        'channel': channel,
        'currency': currency,
        'ip_address': ipAddress,
        'metadata': metadata?.toJson(),
        'log': log,
        'fees': fees,
        'fees_split': feesSplit,
        'authorization': authorization?.toJson(),
        'customer': customer?.toJson(),
        'plan': plan,
        'order_id': orderId,
        'requested_amount': requestedAmount,
        'pos_transaction_data': posTransactionData,
        'source': source,
        'transaction_date': transactionDate,
      };
}
