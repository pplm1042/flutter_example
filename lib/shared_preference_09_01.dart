// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: InternalExample(),
//     );
//   }
// }

// class InternalExample extends StatefulWidget {
//   const InternalExample({super.key});

//   @override
//   State<InternalExample> createState() => _InternalExampleState();
// }

// class _InternalExampleState extends State<InternalExample> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loadData();
//   }

//   int _counter = 0;

//   void _setData(int value) async {
//     var key = 'count';
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setInt(key, value);
//   }

//   void _loadData() async {
//     var key = 'count';
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     setState(() {
//       var value = pref.getInt(key);
//       if (value == null) {
//         _counter = 0;
//       } else {
//         _counter = value;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _counter++;
//             _setData(_counter);
//           });
//         },
//       ),
//       body: Container(
//           child: Row(
//         children: [
//           Expanded(
//               child: Column(children: [Center(child: Text('${_counter}'))])),
//         ],
//       )),
//     );
//   }
// }
