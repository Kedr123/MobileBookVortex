import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Components/Modules/ListCardBook/ListCardBook.dart';
import '../Controllers/BookController.dart';
import '../Models/Book.dart';
import '../main.dart';
import './../constants.dart' as constantsColor;

class StarPage extends StatefulWidget {
  const StarPage({super.key});

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {

  List<Book> books =[];

  void getBooks() async {
    var newList = await BookController.getAllBook(databaseGlobal);
    List<Book> starList = [];
    for(var i = 0; i<newList.length; i++){
      if(newList[i].is_star==1) starList.add(newList[i]);
    }
    setState((){
      books= starList;
    });
  }

  @override
  Widget build(BuildContext context) {
    getBooks();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantsColor.baseOppositeBackColor,
        title: Text(
          "Избранные",
          maxLines: 1,
        ),
      ),
      body: ListCardBook(books:books),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: constantsColor.baseOppositeBackColor,
        currentIndex: 2,
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
