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
    if (args == null) return;
    if (args is! Book) return;
    setState(() {
      book = args as Book;
    });
    super.didChangeDependencies();
  }

  toReadBook(book) {
    Navigator.of(context).pushNamed('/read', arguments: book);
  }

  clickStar(bookOld) async{
    var newBook = Book(
        id: bookOld?.id,
        name: bookOld?.name,
        author: bookOld?.author,
        bookmark: bookOld?.bookmark,
        file_link: bookOld?.file_link,
        img_link: bookOld?.img_link,
        is_star: (bookOld?.is_star==0?1:0)
    );
    BookController.updateDog(newBook, databaseGlobal);
    setState(() {
      book = newBook;
    });
  }

  deleteBook(book)async{
    BookController.deleteDog(book?.id, databaseGlobal);
    Navigator.of(context).pushReplacementNamed('/');
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
              onPressed: () {
                toReadBook(book);
              },
              icon: SvgPicture.asset('lib/assets/img/read.svg'),
            ),
            // IconButton(
            //   onPressed: (){},
            //   icon: SvgPicture.asset('lib/assets/img/StarActiveBook.svg'),
            // )
          ],
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: constantsColor.baseOppositeBackColor,
                      foregroundColor: constantsColor.baseColor,
                      surfaceTintColor: constantsColor.baseColor,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {clickStar(book);},
                    child: Container(
                        child:book?.is_star==0?SvgPicture.asset('lib/assets/img/Star.svg'):SvgPicture.asset('lib/assets/img/StarActiveBook.svg')
                    )
                ),
                Container(width: 40,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: constantsColor.baseOppositeBackColor,
                      foregroundColor: constantsColor.baseColor,
                      surfaceTintColor: constantsColor.baseColor,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {deleteBook(book);},
                    child: Container(
                        child:SvgPicture.asset('lib/assets/img/deleteIcon.svg')
                    ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Text(
                  book?.name ?? "...",
                  style: TextStyle(
                    color: constantsColor.baseColor,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Image(
                    image: AssetImage(
                        "lib/assets/img/" + (book?.img_link ?? '...')))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Автор: ",
                  style: TextStyle(
                    color: constantsColor.baseColor,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: constantsColor.baseColor,
                      foregroundColor: constantsColor.baseColor,
                      surfaceTintColor: constantsColor.baseColor,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {},
                    child: Container(
                      child: Text(
                        "Нет данных",
                        style: TextStyle(
                          color: constantsColor.baseOppositeBackColor,
                          fontSize: 20,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Тип файла: ",
                  style: TextStyle(
                    color: constantsColor.baseColor,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: constantsColor.baseColor,
                      foregroundColor: constantsColor.baseColor,
                      surfaceTintColor: constantsColor.baseColor,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {},
                    child: Container(
                      child: Text(
                        book?.file_link.split(".")[(book?.file_link.split(".").length ?? 1)-1] ?? '...'
                        ,
                        style: TextStyle(
                          color: constantsColor.baseOppositeBackColor,
                          fontSize: 20,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Путь к файлу:",
                  style: TextStyle(
                    color: constantsColor.baseColor,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: constantsColor.baseColor,
                      foregroundColor: constantsColor.baseColor,
                      surfaceTintColor: constantsColor.baseColor,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {},
                    child: Container(
                      child: Text(
                        book?.file_link ?? '...',
                        style: TextStyle(
                          color: constantsColor.baseOppositeBackColor,
                          fontSize: 20,
                        ),
                      ),
                    )),
                Container(
                  height: 200,
                )

              ],
            ),
          ),
        ]));
  }
}
