
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_book_vortex/Components/Modules/ListCardBook/ListCardBook.dart';
import 'package:mobile_book_vortex/Controllers/BookController.dart';
import 'package:mobile_book_vortex/Pages/CreatePage.dart';
import './constants.dart' as constantsColor;

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'Models/Book.dart';
var databaseGlobal;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
      join(await getDatabasesPath(), 'mobile_book_vortex11'),
    onCreate: (db, version){
        return db.execute(
          'CREATE TABLE book(id INTEGER PRIMARY KEY, name TEXT, author TEXT, bookmark TEXT, file_link TEXT, img_link TEXT, is_star INTEGER)'
        );
    },
    version: 1,
  );
  databaseGlobal = database;
  var newBook = Book(
    id:0,
    name:"Иди в лес2",
    author:"Хрен",
    bookmark: "0",
    file_link: "link",
    img_link:"ilink",
    is_star:0,
  );

  await BookController.insertBook(newBook, database);
  print("tt///");
  print(await BookController.getAllBook(database));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: constantsColor.baseBackColor,
        useMaterial3: false,
      ),
      routes: {
        '/':(context)=> MyHomePage(title: 'Книжная полка'),
        '/create':(context)=> CreatePage(),
      },
      // home: const ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Book> books =[];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getBooks() async {
    var newList = await BookController.getAllBook(databaseGlobal);
    setState((){
      books= newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    getBooks();
    // var books = await BookController.getAllBook(databaseGlobal);
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        backgroundColor: constantsColor.baseOppositeBackColor,
        title: Text(
            widget.title,
          maxLines: 1,
        ),
      ),
      body: ListCardBook(books:books),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: constantsColor.baseOppositeBackColor,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (item){
          if(item==0){
            Navigator.of(context).pushReplacementNamed("/");
          }
          if(item==1){
            Navigator.of(context).pushReplacementNamed("/create");
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/Logo.svg"),
            activeIcon: SvgPicture.asset("lib/assets/img/LogoActive.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/create.svg"),
            activeIcon: SvgPicture.asset("lib/assets/img/createActive.svg"),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/Star.svg"),
            activeIcon: SvgPicture.asset("lib/assets/img/StarActive.svg"),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
