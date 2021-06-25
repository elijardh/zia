import 'data.dart';

class ChargeResponse {
  bool status;
  String message;
  Data data;

  ChargeResponse({this.status, this.message, this.data});

  factory ChargeResponse.fromJson(Map<String, dynamic> json) => ChargeResponse(
        status: json['status'] as bool,
        message: json['message'] as String,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
