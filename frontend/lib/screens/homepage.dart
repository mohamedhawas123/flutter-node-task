import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/fake_search.dart';
import '../widget/icon.dart';
import '../widget/header.dart';
import '../widget/annon.dart';
import '../widget/drawer.dart';
import '../provider/getdata.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future? _future;
  Future<dynamic> getData() async {
    final data1 = await Provider.of<DatebaseNode>(context, listen: false).getannonces();
    final data2 = await Provider.of<DatebaseNode>(context, listen: false).getquiz();
    return [data1, data2];
  }

  @override
  void initState() {
    _future = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: _future,
        builder: (context, data) => Scaffold(
          drawerScrimColor: Colors.black,

          drawer: Drawy(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.green),

            backgroundColor: Colors.white,


            actions: [
              Fakesearch(),
              SizedBox(width: 30,),
              Badge( Icon(Icons.message, color: Colors.grey,), "3", Colors.black45),
              Badge( Icon(Icons.notifications_on, color: Colors.grey,), "1", Colors.black45),
              CircleAvatar(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfvBDtLbtr7YxPPVudDz3uYBWAwFpWZxyBhy6-weNl&s"),)

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Annoncement()
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.2,
                          width: 250,
                          color: Colors.white38,
                          child:Stack(
                            children: [
                              Text("What's due", style: TextStyle(color: Colors.teal),),
                              Positioned(
                                top: 20,
                                  child: Text("some times later become something", style: TextStyle(color: Colors.teal, fontSize: 9),)
                              ),

                              Positioned(
                                top: 40,
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: ListView(
                                  children: Provider.of<DatebaseNode>(context, listen: false).quizz.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(

                                          border:Border.all(width: 1.4, color: Colors.teal)
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Course"),
                                                SizedBox(width: 10,),
                                                Text(e.course.toString(), style: TextStyle(color: Colors.teal),)
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                Text("topic"),
                                                SizedBox(width: 10,),
                                                Text(e.topic.toString(),  style: TextStyle(color: Colors.teal))

                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("date"),
                                                SizedBox(width: 10,),
                                                Text(e.dateTime.toString(),  style: TextStyle(color: Colors.teal))

                                              ],
                                            ),




                                          ],
                                        ),

                                      ),
                                    );
                                  }).toList() ,
                                ),
                              )

                            ],
                          ) ,

                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),


        ),
      ),
    );
  }
}
