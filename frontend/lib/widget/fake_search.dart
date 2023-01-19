import 'package:flutter/material.dart';

class Fakesearch extends StatelessWidget {
  const Fakesearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.4),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
        Icon(Icons.search, color: Colors.grey,),
        Text("Search",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),

      ],),
    );
  }
}