class CustomField {
    String display_name;
    String value;
    String variable_name;

    CustomField({this.display_name, this.value, this.variable_name});

    factory CustomField.fromJson(Map<String, dynamic> json) {
        return CustomField(
            display_name: json['display_name'], 
            value: json['value'], 
            variable_name: json['variable_name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['display_name'] = this.display_name;
        data['value'] = this.value;
        data['variable_name'] = this.variable_name;
        return data;
    }
}