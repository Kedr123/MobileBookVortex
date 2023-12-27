import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:mobile_book_vortex/main.dart';
import 'package:sqflite/sqflite.dart';
import '../Controllers/BookController.dart';
import '../Models/Book.dart';
import './../constants.dart' as constantsColor;

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  Book? book;
  String? text;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final args = ModalRoute.of(context as BuildContext)?.settings.arguments;
    if(args==null) return;
    if(args is! Book) return;
    setState(() {
      book = args as Book;
    });
    super.didChangeDependencies();
  }

  void readFile(String link)async{
    File file = new File(link);
    var content = await file.readAsString();
    setState(() {
      text = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    readFile(book?.file_link??"...");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantsColor.baseOppositeBackColor,
        title: Text(
          "Книга",
          maxLines: 1,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('lib/assets/img/read.svg'),
          ),
          // IconButton(
          //   onPressed: (){},
          //   icon: SvgPicture.asset('lib/assets/img/StarActiveBook.svg'),
          // )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Text(
                text??"...",
                textDirection: TextDirection.ltr,
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                softWrap: true,
                style:
                TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
