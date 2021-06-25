class CustomFields {
  String value;
  String displayName;
  String variableName;

  CustomFields({this.value, this.displayName, this.variableName});

  factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
        value: json['value'] as String,
        displayName: json['display_name'] as String,
        variableName: json['variable_name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'display_name': displayName,
        'variable_name': variableName,
      };
}
