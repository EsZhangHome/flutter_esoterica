import 'package:flutter/material.dart';

class PageMine extends StatefulWidget {
  const PageMine({super.key});

  @override
  State<PageMine> createState() => _PageMineState();
}

class _PageMineState extends State<PageMine> with AutomaticKeepAliveClientMixin{


  int _count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_count',
              style: const TextStyle(fontSize: 80, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 60),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
