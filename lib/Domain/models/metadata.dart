import 'custom_fields.dart';

class Metadata {
  List<CustomFields> customFields;

  Metadata({this.customFields});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        customFields: (json['custom_fields'] as List<dynamic>)
            .map((e) => CustomFields.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'custom_fields': customFields.map((e) => e.toJson()).toList(),
      };
}
