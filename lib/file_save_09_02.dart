// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_example/image_down_07_02.dart';
// import 'package:flutter_example/intro_page_09_03.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider/path_provider.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: IntroPage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('로고 바꾸기'),
//         actions: [
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => LargeFileMain()));
//               },
//               child: Text(
//                 '로고 바꾸기',
//                 style: TextStyle(color: Colors.white),
//               ))
//         ],
//       ),
//       body: Container(),
//     );
//   }
// }

// class FileApp extends StatefulWidget {
//   const FileApp({super.key});

//   @override
//   State<FileApp> createState() => _FileAppState();
// }

// class _FileAppState extends State<FileApp> {
//   void writeFruit(String fruit) async {
//     var dir = await getApplicationDocumentsDirectory();
//     var file = await File(dir.path + '/fruit.txt').readAsString();
//     file = file + '\n' + fruit;
//     File(dir.path + '/fruit.txt').writeAsStringSync(file);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     readCountFile();
//     initData();
//   }

//   void initData() async {
//     var result = await readListFile();
//     setState(() {
//       itemList.addAll(result!);
//     });
//   }

//   int _counter = 0;
//   List<String> itemList = [];
//   TextEditingController controller = new TextEditingController();

//   void writeCountFile(int count) async {
//     var dir = await getApplicationDocumentsDirectory();
//     File(dir.path + '/count.txt').writeAsStringSync(_counter.toString());
//   }

//   void readCountFile() async {
//     try {
//       var dir = await getApplicationDocumentsDirectory();
//       var file = await File(dir.path + '/count.txt').readAsString();
//       print(file);

//       setState(() {
//         _counter = int.parse(file);
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<List<String>?> readListFile() async {
//     List<String> itemList = [];
//     var key = 'first';
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     bool? firstCheck = pref.getBool(key);
//     var dir = await getApplicationDocumentsDirectory();
//     bool fileExist = await File(dir.path + '/fruit.txt').exists();

//     if (firstCheck == null || firstCheck == false || fileExist == false) {
//       pref.setBool(key, true);
//       var file =
//           await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
//       File(dir.path + '/fruit.txt').writeAsStringSync(file);
//       var array = file.split('\n');
//       for (var item in array) {
//         print(item);
//         itemList.add(item);
//       }

//       return itemList;
//     } else {
//       var file = await File(dir.path + '/fruit.txt').readAsString();
//       var array = file.split('\n');
//       for (var item in array) {
//         print(item);
//         itemList.add(item);
//       }
//       return itemList;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Example'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           writeFruit(controller.value.text);
//           setState(() {
//             itemList.add(controller.value.text);
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Container(
//         child: Center(
//             child: Column(
//           children: [
//             TextField(
//               controller: controller,
//               keyboardType: TextInputType.text,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Center(
//                       child: Text(
//                         itemList[index],
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: itemList.length,
//               ),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
