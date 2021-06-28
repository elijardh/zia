import 'Data.dart';

class ChargeResponse {
    Data data;
    String message;
    bool status;

    ChargeResponse({this.data, this.message, this.status});

    factory ChargeResponse.fromJson(Map<String, dynamic> json) {
        return ChargeResponse(
            data: json['`data`'] != null ? Data.fromJson(json['`data`']) : null,
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.data != null) {
            data["data"] = this.data.toJson();
        }
        return data;
    }
}