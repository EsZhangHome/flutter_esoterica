import 'package:flutter/material.dart';
import 'package:flutter_esoterica/page/home/page_home.dart';
import 'package:flutter_esoterica/page/likes/page_likes.dart';
import 'package:flutter_esoterica/page/mine/page_mine.dart';
import 'package:flutter_esoterica/page/query/page_query.dart';
import 'package:flutter_esoterica/widgets/bottom_bar.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  int _currentIndex = 0;

  //页面控制器，初始 0
  final PageController _controller = PageController(
    initialPage: 0
  );
  late List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    _widgets = [
      const PageHome(),
      const PageLikes(),
      const PageQuery(),
      const PageMine()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          // 禁止滑动后 不监听 该方法，不用更新 bottom bar index
          // onPageChanged: (index) {
          //   print(index);
          //   setState(() {
          //     _currentIndex = index;
          //   });
          // },
          physics: const NeverScrollableScrollPhysics(), // 禁止 pageView 滑动
          controller: _controller,
          children: _widgets,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.green[300],
              //设置四周圆角 角度
              borderRadius: const BorderRadius.all(Radius.circular(90.0)),
              //设置四周边框
              border: Border.all(width: 1, color: Colors.green[300]!),
            ),
            child: SalomonBottomBar(
              itemPadding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              selectedColorOpacity: 0.3,
              currentIndex: _currentIndex,
              onTap: (i) {
                if (i == _currentIndex) return;
                setState(() {
                  _currentIndex = i;
                  // 用动画的 跳转 途径的所有 page 都会 在 onPageChanged 中回调
                  // _controller.animateToPage(i,
                  //     duration: const Duration(milliseconds: 500),
                  //     curve: Curves.linear);
                  _controller.jumpToPage(i); // 直接跳转到 对应的 page
                });
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Home"),
                  selectedColor: Colors.purple,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(Icons.favorite_border),
                  title: const Text("Likes"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.search),
                  title: const Text("Search"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person),
                  title: const Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
