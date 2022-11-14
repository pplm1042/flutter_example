// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SubPage Example',
//       theme: ThemeData(primaryColor: Colors.blue),
//       // home: FirstPage(),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => FirstPage(),
//         '/second': (context) => SecondPage()
//       },
//     );
//   }
// }

// class FirstPage extends StatefulWidget {
//   const FirstPage({super.key});

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sub Page Main')),
//       body: Container(
//         child: Center(
//           child: Text('첫 번째 페이지'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).pushNamed('/second');
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Page'),
//       ),
//       body: Container(
//         child: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('돌아가기'),
//           ),
//         ),
//       ),
//     );
//   }
// }
