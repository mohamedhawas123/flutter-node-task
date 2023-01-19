import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/input.dart';
import '../provider/getdata.dart';


class PostQuizz extends StatefulWidget {
  const PostQuizz({Key? key}) : super(key: key);

  @override
  State<PostQuizz> createState() => _PostQuizzState();
}

class _PostQuizzState extends State<PostQuizz> {


  late String course = "";
  late String topic = "";
  late String unite = "";
  final key = GlobalKey<FormState>();

  void submit() {
    if(!key.currentState!.validate()) {
      return;
    } else{

      key.currentState!.save();
      Provider.of<DatebaseNode>(context, listen: false).postQuizz(course, topic, unite);
      Navigator.of(context).pushReplacementNamed("home");
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("post Quizz"),),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 90, horizontal: 30),
        child: Container(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: textFormDecor.copyWith(labelText: "course"),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'enter value';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      course=  value!;
                    });
                  },
                ),

                TextFormField(
                  decoration: textFormDecor.copyWith(labelText: "topic"),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'enter value';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      topic =  value!;
                    });
                  },
                ),

                TextFormField(
                  decoration: textFormDecor.copyWith(labelText: "unite"),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'enter value';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      unite=  value!;
                    });
                  },
                ),

                Container(
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: TextButton(
                    onPressed: submit,
                    child: Text("submit", style: TextStyle(color: Colors.green),),
                  ),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
