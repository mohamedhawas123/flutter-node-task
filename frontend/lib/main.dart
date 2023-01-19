import 'package:flutter/material.dart';
import './screens/homepage.dart';
import 'package:provider/provider.dart';
import './provider/getdata.dart';
import './screens/post_annonce.dart';
import './screens/post_quiz.dart';
import './screens/welcomescreen.dart';



void main() {
  runApp(const Home());
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> DatebaseNode() ,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Robo'
        ),
        home: WelcomeScreen(),
        routes: {
          "post_announ" :(context) => PostAnnouncement(),
          "post_quiz": (context) => PostQuizz(),
          "home": (context) => HomePage()
        },

      ),
    );
  }
}


