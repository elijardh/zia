import 'Data.dart';

class chargeresponse {
    Data data;
    String message;
    bool status;

    chargeresponse({this.data, this.message, this.status});

    factory chargeresponse.fromJson(Map<String, dynamic> json) {
        return chargeresponse(
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