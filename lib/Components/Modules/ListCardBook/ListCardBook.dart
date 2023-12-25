import 'package:flutter/material.dart';
import 'package:mobile_book_vortex/Components/Modules/ListCardBook/CardBook.dart';

class ListCardBook extends StatelessWidget {
  // const ListCardBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      addAutomaticKeepAlives: true,

      children:[
          CardBook(),
          CardBook(),
          CardBook(),
          CardBook(),
          CardBook(),
          CardBook(),
          CardBook(),
          CardBook(),
          CardBook(),
        ],
    );
  }
}
