
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../Models/Book.dart';
import './../../../constants.dart' as constantsColor;

class CardBook extends StatefulWidget {
  const CardBook({super.key, required this.book});

  final Book book;

  @override
  State<CardBook> createState() => _CardBook();
}

class _CardBook extends State<CardBook> {

  void getBook(book){
    Navigator.of(context).pushNamed('/book',arguments: book);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10,0),
        child:  ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: constantsColor.baseBackColor,
          foregroundColor: constantsColor.baseColor,
            surfaceTintColor: constantsColor.baseColor,
            padding: EdgeInsets.all(0),

          side: BorderSide(width: 1, color: constantsColor.baseColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
          alignment: Alignment.topLeft,
        ),

        onPressed: (){getBook(widget.book);},
        child: Container(
        alignment: Alignment.topLeft,
        // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        // width: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage("lib/assets/img/"+widget.book.img_link),
              width: 85,
              height: 120,
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            widget.book.name,
                            textDirection: TextDirection.ltr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                        ),
                        Text("Автор: "+widget.book.author),
                        Text(widget.book.file_link.split(".")[widget.book.file_link.split(".").length-1]),
                      ],
                    )))
          ],
        ))));
  }
}
