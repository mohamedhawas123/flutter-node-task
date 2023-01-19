import 'package:flutter/material.dart';


class Drawy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [

            AppBar(title: Text("Welcome Talia,", style: TextStyle(color: Colors.teal, fontSize: 15)), backgroundColor: Colors.white38, automaticallyImplyLeading: false, ),


            Divider(),

            ListTile(
              leading: Icon(Icons.post_add),
              title: Text("Post Announcement"),
              onTap: () => Navigator.pushNamed(context, "post_announ"),

            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("Post Quiz"),
              onTap: () => Navigator.pushNamed(context, "post_quiz"),

            ),











          ],
        ),
      ),
    );
  }
}
