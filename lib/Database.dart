import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/material.dart';



// class DBProvider {
//   DBProvider._();
//   static final DBProvider db = DBProvider._();
//
//   static Database _datebase;
//
//   Future<Database> get database async {
//     if (_database != null)
//       return _database;
//
//     // if _database is null we instantiate it
//     _database = await initDB();
//     return _database;
//   }
//
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "TestDB.db");
//     return await openDatabase(path, version: 1, onOpen: (db) {
//     }, onCreate: (Database db, int version) async {
//       await db.execute("CREATE TABLE Client ("
//           "id INTEGER PRIMARY KEY,"
//           "first_name TEXT,"
//           "last_name TEXT,"
//           "blocked BIT"
//           ")");
//     });
//   }
// }

