import 'package:shop_appp/core/view/palette.dart';
import 'package:shop_appp/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();
  static final CartDataBaseHelper db = CartDataBaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct (
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL,
        $columnProductId TEXT NOT NULL)
        ''');
    });
  }

  deleteProduct(String productId) async {
    Database _db = await database;
    await _db.delete(
      'cartProduct',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  deleteAllProducts() async {
    Database _db = await database;
    await _db.delete(
      'cartProduct',
    );
  }

  Future<List<CartProductModel>> getAllProducts() async {
    Database? dbClient = await database;
    List<Map> maps = await dbClient.query('cartProduct');

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;

    await dbClient.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(
      tableCartProduct,
      model.toJson(),
      where: '$columnProductId = ?',
      whereArgs: [model.productId],
    );
  }
}
