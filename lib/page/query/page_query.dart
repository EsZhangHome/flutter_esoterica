import 'package:flutter/material.dart';

class PageQuery extends StatelessWidget {
  const PageQuery({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio:
    1,crossAxisSpacing: 2,mainAxisSpacing: 2), itemBuilder: (context,index){
      return Container(
        color: Colors.green[200],
        child: Center(
          child: Text("$index",style: const TextStyle(color: Colors.white,fontSize: 20),),
        ),
      );
    },itemCount: 100,);
  }
}
