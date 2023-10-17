import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(title: Text('home page $index',style: const TextStyle(fontSize: 20,color: Colors.green),),);
    },itemCount: 100,);
  }
}
