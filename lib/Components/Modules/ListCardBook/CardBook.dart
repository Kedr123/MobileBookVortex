import 'package:flutter/material.dart';


class CardBook extends StatelessWidget {
  // const CardBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child:  const Row(
        children: [
          Image(image: AssetImage("lib/assets/img/dPre.png"),width: 85, height: 120,),
          Column(

            children: [
              // Flexible(
              //   fit: FlexFit.loose,
              //   child: Text(
              //     "Власть книжного червя. 3 часть: ученица храма...",
              //
              //     // maxLines: 2,
              //     // overflow: TextOverflow.ellipsis,
              //   ),
              // ),
              Text(
                "Власть книжного червя. 3 часть: ученица храма...",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // Text("Автор: Тоторо"),
              // Text("EPAB"),
            ],
          )
        ],

      )
    );
  }
}
