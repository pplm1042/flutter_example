// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_example/sliver_11_03.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationApp(),
    );
  }
}

class AnimationApp extends StatefulWidget {
  const AnimationApp({super.key});

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  List<People> peoples = [];
  Color weightColor = Colors.blue;
  int current = 0;
  double _opacity = 1;

  @override
  void initState() {
    // TODO: implement initState
    peoples.add(People('스미스', 180, 92));
    peoples.add(People('메리', 162, 55));
    peoples.add(People('존', 177, 92));
    peoples.add(People('바트', 130, 40));
    peoples.add(People('콘', 194, 140));
    peoples.add(People('디디', 100, 80));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Example')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text('이름 : ${peoples[current].name}'),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        color: Colors.amber,
                        width: 50,
                        height: peoples[current].height,
                        child: Text(
                          '키 ${peoples[current].height}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInCubic,
                        color: weightColor,
                        width: 50,
                        height: peoples[current].weight,
                        child: Text(
                          '몸무게 ${peoples[current].weight}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.linear,
                        color: Colors.pinkAccent,
                        width: 50,
                        height: peoples[current].bmi,
                        child: Text(
                          '키 ${peoples[current].bmi.toString().substring(0, 2)}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (current < peoples.length - 1) {
                        current++;
                      }
                      _changeWeightColor(peoples[current].weight);
                    });
                  },
                  child: const Text('다음')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (current > 0) {
                        current--;
                      }
                      _changeWeightColor(peoples[current].weight);
                    });
                  },
                  child: const Text('이전')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _opacity == 1 ? _opacity = 0 : _opacity = 1;
                    });
                  },
                  child: const Text('사라지기')),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      Hero(
                        tag: 'detail',
                        child: Icon(Icons.cake),
                      ),
                      Text('이동하기')
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SliverPage()));
                  },
                  child: Text('페이지 이동'))
            ],
          ),
        ),
      ),
    );
  }

  void _changeWeightColor(double weight) {
    if (weight < 40) {
      weightColor = Colors.blueAccent;
    } else if (weight < 60) {
      weightColor = Colors.indigo;
    } else if (weight < 80) {
      weightColor = Colors.orange;
    } else {
      weightColor = Colors.red;
    }
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _rotateAnimation;
  Animation? _scaleAnimation;
  Animation? _transAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _rotateAnimation =
        Tween<double>(begin: 0, end: pi * 10).animate(_animationController!);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController!);
    _transAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(200, 200))
        .animate(_animationController!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example2'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _rotateAnimation!,
                builder: (context, widget) {
                  return Transform.translate(
                    offset: _transAnimation!.value,
                    child: Transform.rotate(
                      angle: _rotateAnimation!.value,
                      child: Transform.scale(
                        scale: _scaleAnimation!.value,
                        child: widget,
                      ),
                    ),
                  );
                },
                child: const Hero(
                  tag: 'detail',
                  child: Icon(
                    Icons.cake,
                    size: 300,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _animationController!.forward();
                },
                child: const Text('로테이션 시작하기'),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

class People {
  String name;
  double height;
  double weight;
  double? bmi;
  People(
    this.name,
    this.height,
    this.weight,
  ) {
    bmi = weight / ((height / 100) * (height / 100));
  }
}
