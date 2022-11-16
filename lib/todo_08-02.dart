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
//         '/': (context) => SubDetail(),
//         '/second': (context) => SecondDetail(),
//         '/third': (context) => ThirdDetail()
//       },
//     );
//   }
// }

// class SubDetail extends StatefulWidget {
//   const SubDetail({super.key});

//   @override
//   State<SubDetail> createState() => _SubDetailState();
// }

// class _SubDetailState extends State<SubDetail> {
//   List<String> todoList = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     todoList.add('당근 사오기');
//     todoList.add('약 사오기');
//     todoList.add('청소하기');
//     todoList.add('부모님께 전화하기');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sub Detail Example')),
//       body: ListView.builder(
//           itemCount: todoList.length,
//           itemBuilder: (context, index) {
//             return Card(
//               child: InkWell(
//                 child: Text(
//                   todoList[index],
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 onTap: () {
//                   Navigator.of(context)
//                       .pushNamed('/third', arguments: todoList[index]);
//                 },
//               ),
//             );
//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _addNavigation(context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _addNavigation(BuildContext context) async {
//     final result = await Navigator.of(context).pushNamed('/second');

//     setState(() {
//       todoList.add(result as String);
//     });
//   }
// }

// class SecondDetail extends StatelessWidget {
//   const SecondDetail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = new TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Page'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               TextField(
//                 controller: controller,
//                 keyboardType: TextInputType.text,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(controller.value.text);
//                 },
//                 child: Text('저장하기'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ThirdDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final String args = ModalRoute.of(context)!.settings.arguments as String;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Third Page'),
//       ),
//       body: Container(
//         child: Center(
//             child: Text(
//           args,
//           style: TextStyle(fontSize: 30),
//         )),
//       ),
//     );
//   }
// }
