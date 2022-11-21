// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_example/animation_11_01.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: IntroPage(),
//     );
//   }
// }

// class SaturnLoading extends StatefulWidget {
//   final _SaturnLoadingState _saturnLoading = _SaturnLoadingState();

//   @override
//   State<SaturnLoading> createState() => _SaturnLoadingState();

//   void start() {
//     _saturnLoading.start();
//   }

//   void stop() {
//     _saturnLoading.stop();
//   }
// }

// class _SaturnLoadingState extends State<SaturnLoading>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _animationController;
//   Animation? _animation;

//   void stop() {
//     _animationController!.stop(canceled: true);
//   }

//   void start() {
//     _animationController!.repeat();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 3));
//     _animation =
//         Tween<double>(begin: 0, end: pi * 2).animate(_animationController!);
//     _animationController!.repeat();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _animationController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animationController!,
//       builder: (BuildContext context, Widget? child) {
//         return SizedBox(
//           width: 100,
//           height: 100,
//           child: Stack(children: [
//             Image.asset(
//               'repo/images/circle.png',
//               width: 100,
//               height: 100,
//             ),
//             Center(
//               child: Image.asset(
//                 'repo/images/sunny.png',
//                 width: 30,
//                 height: 30,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(5),
//               child: Transform.rotate(
//                 angle: _animation!.value,
//                 origin: Offset(35, 35),
//                 child: Image.asset(
//                   'repo/images/saturn.png',
//                   width: 20,
//                   height: 20,
//                 ),
//               ),
//             )
//           ]),
//         );
//       },
//     );
//   }
// }

// class IntroPage extends StatefulWidget {
//   const IntroPage({super.key});

//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }

// class _IntroPageState extends State<IntroPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               Text('애니메이션 앱'),
//               SizedBox(
//                 height: 20,
//               ),
//               SaturnLoading()
//             ],
//             mainAxisAlignment: MainAxisAlignment.center,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<Timer> loadData() async {
//     return Timer(Duration(seconds: 5), onDoneLoading);
//   }

//   onDoneLoading() async {
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => AnimationApp()));
//   }
// }
