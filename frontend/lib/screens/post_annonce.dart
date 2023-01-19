import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/input.dart';
import '../provider/getdata.dart';


class PostAnnouncement extends StatefulWidget {
  const PostAnnouncement({Key? key}) : super(key: key);

  @override
  State<PostAnnouncement> createState() => _PostAnnouncementState();
}

class _PostAnnouncementState extends State<PostAnnouncement> {


  late String name = "";
  late String announce = "";
  late String imageUrl = "";
  final key = GlobalKey<FormState>();

  void submit() {
    if(!key.currentState!.validate()) {
      return;
    } else{
      print(name);
      print(announce);
      print(imageUrl);
      key.currentState!.save();
    Provider.of<DatebaseNode>(context, listen: false).postAnnounce(name, announce, imageUrl);
    Navigator.of(context).pushReplacementNamed("home");
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("post announcement"),),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 90, horizontal: 30),
          child: Container(
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    decoration: textFormDecor.copyWith(labelText: "name"),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'enter value';
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        name=  value!;
                      });
                    },
                  ),

                  TextFormField(
                    decoration: textFormDecor.copyWith(labelText: "announce"),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'enter value';
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        announce=  value!;
                      });
                    },
                  ),

                  TextFormField(
                    decoration: textFormDecor.copyWith(labelText: "imageUrl"),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'enter value';
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        imageUrl=  value!;
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
