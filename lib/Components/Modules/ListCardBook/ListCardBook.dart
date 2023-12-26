
import 'package:flutter/material.dart';
import 'package:mobile_book_vortex/Components/Modules/ListCardBook/CardBook.dart';

import '../../../Models/Book.dart';

class ListCardBook extends StatefulWidget {
  const ListCardBook({super.key, required this.books});

  final List<Book> books;

  @override
  State<ListCardBook> createState() => _ListCardBook();
}

class _ListCardBook extends State<ListCardBook> {
  // const ListCardBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.books.length,
      itemBuilder: (context, index)=>CardBook(book: widget.books[index]),
    );
  }
}
