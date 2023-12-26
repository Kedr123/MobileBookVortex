

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

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  void getFilePicker() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      // allowedExtensions: ['txt'],
    );

    if (result != null) {
      Random random = new Random();
      PlatformFile file = result.files.first;
      var newBook = Book(
        id:0,
        name: file.name,
        author: "не указан",
        bookmark: "0",
        file_link: file.path.toString(),
        img_link: "default"+random.nextInt(2).toString()+".png",
        is_star: 0
      );

      await BookController.insertBook(newBook, databaseGlobal);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantsColor.baseOppositeBackColor,
        title: Text(
         "Добавление книги",
          maxLines: 1,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Выбирите файл"),
            ElevatedButton(
                onPressed: getFilePicker,
                child: Text("Выбрать файл")
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: constantsColor.baseOppositeBackColor,
        currentIndex: 1,
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
