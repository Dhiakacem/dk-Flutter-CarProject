import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/car.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstartuct();

  static final DataBaseHelper instance = DataBaseHelper._privateConstartuct();

  DataBaseHelper();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'gestioncar.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      //onUpgrade: ,
      //onDowngrade : ,
    );
  }



Future _onCreate(Database db , int version) async {
  print("creation de database ......");
  await db.execute('''
  Create Table Car(
  id INTEGER PRIMARY KEY , 
  mat TEXT NOT NULL ,
  couleur TEXT NOT NULL ,
  energie TEXT NOT NULL ,
  options TEXT NOT NULL 
);
''');


}
  Future<int> add(Car car) async{
    Database db = await instance.database ;
    return await db.insert('Car' , car.toMap());
  }

  Future getallcars() async{
    Database db = await instance.database ;
    return await db.rawQuery("select * from Car");
  }


}
