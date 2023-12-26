import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_book_vortex/main.dart';
import 'package:sqflite/sqflite.dart';
import '../Controllers/BookController.dart';
import '../Models/Book.dart';
import './../constants.dart' as constantsColor;


class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Book? book;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final args = ModalRoute.of(context)?.settings.arguments;
    if(args==null) return;
    if(args is! Book) return;
    setState(() {
      book = args as Book;
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantsColor.baseOppositeBackColor,
        title: Text(
          "О книге",
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
        child: Column(
          children: [
            Text(book?.name ?? "..."),

          ],
        ),
      ),
    );
  }
}
