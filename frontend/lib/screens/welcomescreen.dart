import 'package:flutter/material.dart';




class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("home");
            },
            child: Text("Log In", style: TextStyle(color: Colors.blueAccent),),
          ),
        ),
      ) ,
    );
  }
}
