import 'package:sqflite/sqflite.dart';
import 'package:zia/Domain/cartModel.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();

  static String name;
  static int price;
  static int amount;
  Database database;

  Future<Database> get db async {
    if (database != null) {
      return database;
    }
    database = await initDB();
    return database;
  }

  delete() async {
    String path = await getDatabasesPath();
    String dataPath = path + "cart";
    await deleteDatabase(dataPath);
    print("deleted");
  }

  initDB() async {
    String path = await getDatabasesPath();
    String dataPath = path + "cart";
    var data = await openDatabase(dataPath, version: 1, onCreate: _onCreate);
    return data;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT,objID TEXT, name TEXT, price INT, amount INT )");
  }

  Future addToCart(CartModel model) async {
    var dbClient = await db;
    var res = dbClient.insert("cart", model.toJson());
    return res;
/*    if (getItem(model.objID) == null) {
      throw Exception("Item already exist in cart");
    } else {
      var res = dbClient.insert("cart", model.toJson());
      return res;
    }*/
  }

  updateCart(CartModel model) async {
    var dbClient = await db;
    CartModel mod =
        CartModel(price: model.price, name: model.name, amount: model.amount);
    var res = dbClient
        .update("cart", mod.toJson(), where: "id = ?", whereArgs: [model.id]);
    return res;
  }

  deleteCart(int id) async {
    final dbClient = await db;
    dbClient.delete("cart", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final dbClient = await db;
    dbClient.rawDelete("Delete * from cart");
  }

  Future<List<CartModel>> getCart() async {
    final dbClient = await db;
    var res = await dbClient.query("cart");
    List<CartModel> list =
        res.isNotEmpty ? res.map((c) => CartModel.fromJson(c)).toList() : [];
    return list;
  }

  getItem(String id) async {
    final dbClient = await db;
    var res = await dbClient.query("cart", where: "objID = ?", whereArgs: [id]);
    return res;
  }
}
