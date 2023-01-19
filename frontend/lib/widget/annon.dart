import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/getdata.dart';

class Annoncement extends StatelessWidget {
  const Annoncement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white38,
        height: MediaQuery.of(context).size.height*0.4,
        width: double.infinity,
        child: Stack(
          children: [
            Text("Announcements", style: TextStyle(fontSize: 18, color: Colors.teal),),
            Positioned(
                top: 30,

                child: Text("We Educate awesome, Keep Updated", style: TextStyle(fontSize: 8, color: Colors.grey),
                )),
            Positioned(
                right: 5,

                child: Text("All")  ),

            Positioned(
                right: 0,
                left:2 ,
                top: 50,
                bottom: 0,
                child: ListView(
                  shrinkWrap: true,
                  children:  Provider.of<DatebaseNode>(context, listen: false).annonce.map((e) {
                    return ListTile(

                      leading: CircleAvatar(
                        radius: 20 ,
                        backgroundColor: Colors.white10,
                        child: Image.network(e.imageUrl.toString(),),) ,
                      title: Text(e.name.toString(), style: TextStyle(fontSize: 6),),
                      trailing: Text(e.annonce.toString(), style: TextStyle(fontSize: 8, color: Colors.teal),),
                      subtitle: Text(e.dateTime.toString(), style: TextStyle(fontSize: 5),),

                    );
                  }).toList() ,
                )
            )
          ],
        )
    );
  }
}


