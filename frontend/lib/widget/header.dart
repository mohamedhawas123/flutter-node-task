import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        color: Colors.white60,
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.stretch  ,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("EXAMS TIME", style: TextStyle(fontSize: 24, color: Colors.blueAccent),),
                    SizedBox(height: 8,),
                    Text("Here We are, Are you Ready to fight? Don't worry \n  we  sometips to  be ready  for your exams", style: TextStyle(color: Colors.blue, fontSize: 12),),
                    SizedBox(height: 12,),
                    Text(' "nothing happend until something moves -albert Einstain" ', style: TextStyle(color: Colors.grey, fontSize: 6) ,),
                    SizedBox(height: 10,),
                    Container(
                      height: 35,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.teal,

                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextButton(onPressed: (){}, child: Text("View exams tips", style: TextStyle(color: Colors.white),), ),
                    )
                  ],
                ),
              ),
            ),

          ],
        )
    );
  }
}
