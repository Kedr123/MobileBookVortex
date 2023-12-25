
import 'dart:ui';

import 'package:flutter/material.dart';
import './../../../constants.dart' as constantsColor;

class CardBook extends StatelessWidget {
  // const CardBook({super.key});

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

        onPressed: ()=>{},
        child: Container(
        alignment: Alignment.topLeft,
        // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        // width: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage("lib/assets/img/dPre.png"),
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
                            "Власть книжного червя. 3 ча сть: ученица храма...",
                            textDirection: TextDirection.ltr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                        ),
                        Text("Автор: Тоторо"),
                        Text("EPAB"),
                      ],
                    )))
          ],
        ))));
  }
}
