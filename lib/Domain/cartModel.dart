class CartModel {
  int id;
  String objID;
  String name;
  int price;
  int amount;

  CartModel({this.name, this.amount, this.price, this.id, this.objID});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        objID: json["objID"],
        amount: json["amount"],
        name: json["name"],
        price: json["price"],
        id: json["id"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["amount"] = this.amount;
    data["name"] = this.name;
    data["price"] = this.price;
    data["objID"] = this.objID;
    return data;
  }
}
