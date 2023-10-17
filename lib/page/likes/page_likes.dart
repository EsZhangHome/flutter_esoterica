import 'package:flutter/material.dart';

class PageLikes extends StatelessWidget {
  const PageLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4,right: 4),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300, //横轴三个子widget
              childAspectRatio: 1.0, //宽高比为1时，子widget
              crossAxisSpacing: 4,
              mainAxisSpacing: 4),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue,
              child: Center(
                  child: Text(
                index.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
            );
          },itemCount: 100,),
    );
  }
}
