import 'package:flutter/material.dart';
import '../models/annoncements.dart';
import 'package:dio/dio.dart';
import '../models/quizmodels.dart';
import 'dart:convert';

class DatebaseNode extends ChangeNotifier {


  List<Annoncement> _annonce = [];


  List<Annoncement> get annonce {
    return [..._annonce];
  }


  List<Quizz> _quizz= [];


  List<Quizz> get quizz {
    return [..._quizz];
  }



var dio = Dio();

  Future<List<Annoncement>> getannonces()async {

    try {
      List<Annoncement> loadeddata = [];
      final response = await dio.get("https://node-flu-production.up.railway.app/annonce/");
      final data = response.data as List;

      data.map((e) {
        loadeddata.add(Annoncement(
          name: e['name'],
          annonce: e['annonce'],
          imageUrl: e['imageUrl'],
            dateTime: DateTime.parse(e['createdAt'])
        ));
      }).toList();
      _annonce = loadeddata;
      notifyListeners();
    }catch(e) {
      print(e);
    }
  return annonce;
  }

  Future<void> postAnnounce(name, annoncee, imageUrl)async {

    _annonce.add(Annoncement(
      name: name,
      dateTime: DateTime.now(),
      imageUrl: imageUrl,
      annonce: annoncee
    ));
    notifyListeners();

    try {
      final response = await dio.post("https://node-flu-production.up.railway.app/annonce/post/",
        data: json.encode({
        "name": name,
          "annonce": annoncee,
          "imageUrl": imageUrl
        })
      );
      print(response.data);


    }catch(e) {
      print(e);
    }
    
    
  }


  Future<List<Quizz>> getquiz()async {

    try {
      List<Quizz> loadeddataquiz = [];
      final response = await dio.get("https://node-flu-production.up.railway.app/quiz/");
      final data = response.data as List;

      data.map((e) {
        loadeddataquiz.add(Quizz(
            course: e['course'],
            topic: e['topic'],
            unite: e['unite'],
            dateTime: DateTime.parse(e['createdAt'])
        ));
      }).toList();
      _quizz = loadeddataquiz;
      notifyListeners();
    }catch(e) {
      print(e);
    }
    print(quizz);
    return quizz;
  }


  Future<void> postQuizz(course, topic, unite)async {

    _quizz.add(Quizz(
        course: course,
      dateTime: DateTime.now(),
      topic: topic,
      unite: unite
    ));
    notifyListeners();

    try {
      final response = await dio.post("https://node-flu-production.up.railway.app/quiz/postquiz/",
          data: json.encode({
            "course": course,
            "topic": topic,
            "unite": unite
          })
      );
      print(response.data);

    }catch(e) {
      print(e);
    }


  }
  
  Future<void> editannount(id, name,annoncee )async {
    
    try{
      
      final response=  await dio.put("https://node-flu-production.up.railway.app/edit/$id",
      data: json.encode({
        "name": name,
        "annonce": annoncee

      })
      );
      print(response.data);
      
    }catch(e){
      print(e);
    }
    
    
  }

  Future<void> deleteannount(id)async {

    try{

      await dio.delete("https://node-flu-production.up.railway.app/$id/delete");


    }catch(e){
      print(e);
    }


  }




}