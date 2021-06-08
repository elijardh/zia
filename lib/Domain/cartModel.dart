class CartModel {
  int id;
  String name;
  int price;
  int amount;

  CartModel({this.name, this.amount, this.price, this.id});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
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
    return data;
  }
}
