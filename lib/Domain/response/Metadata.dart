import 'CustomField.dart';

class Metadata {
    List<CustomField> custom_fields;

    Metadata({this.custom_fields});

    factory Metadata.fromJson(Map<String, dynamic> json) {
        return Metadata(
            custom_fields: json['custom_fields'] != null ? (json['custom_fields'] as List).map((i) => CustomField.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.custom_fields != null) {
            data['custom_fields'] = this.custom_fields.map((v) => v.toJson()).toList();
        }
        return data;
    }
}