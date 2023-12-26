import 'package:sqflite/sqflite.dart';

import './../Models/Book.dart';

class BookController {
  static Future<void> insertBook(Book book, database) async {
    // Get a reference to the database.
    final db = await database;

    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM book");
    int id = 0;
    if(table.first["id"]!=null){
    id = table.first["id"];
    }


    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'book',
      book.toMapNewId(id),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Book>> getAllBook(database) async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('book');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Book(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        author: maps[i]['author'] as String,
        bookmark: maps[i]['bookmark'] as String,
        file_link: maps[i]['file_link'] as String,
        img_link: maps[i]['img_link'] as String,
        is_star: maps[i]['is_star'] as int,
      );
    });
  }
}