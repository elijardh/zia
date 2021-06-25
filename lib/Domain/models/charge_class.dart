import 'card.dart';
import 'metadata.dart';

class ChargeClass {
  String email;
  String amount;
  Metadata metadata;
  Card card;
  String pin;

  ChargeClass({
    this.email,
    this.amount,
    this.metadata,
    this.card,
    this.pin,
  });

  factory ChargeClass.fromJson(Map<String, dynamic> json) => ChargeClass(
        email: json['email'] as String,
        amount: json['amount'] as String,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        card: json['card'] == null
            ? null
            : Card.fromJson(json['card'] as Map<String, dynamic>),
        pin: json['pin'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'amount': amount,
        'metadata': metadata.toJson(),
        'card': card.toJson(),
        'pin': pin,
      };
}
