// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SliverPage(),
//     );
//   }
// }

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  Widget customCard(String text) {
    return Card(
      child: Container(
        height: 120,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver Example'),
              background: Image.asset('repo/images/sunny.png'),
            ),
            backgroundColor: Colors.deepOrangeAccent,
            pinned: true,
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(
                  minHeight: 50,
                  maxHeight: 150,
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "List 숫자",
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ))),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: customCard('list count : ${index}'),
              );
            }, childCount: 10),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(
                  minHeight: 50,
                  maxHeight: 150,
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "그리드 숫자",
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ))),
          SliverGrid(
              delegate: SliverChildListDelegate([
                customCard('1'),
                customCard('2'),
                customCard('3'),
                customCard('4'),
              ]),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _HeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
