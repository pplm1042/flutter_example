// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:path_provider/path_provider.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LargeFileMain(),
//     );
//   }
// }

// class LargeFileMain extends StatefulWidget {
//   const LargeFileMain({super.key});

//   @override
//   State<LargeFileMain> createState() => _LargeFileMainState();
// }

// class _LargeFileMainState extends State<LargeFileMain> {
//   Future<void> downloadFile() async {
//     Dio dio = Dio();
//     try {
//       var dir = await getApplicationSupportDirectory();
//       await dio.download(
//         imgUrl,
//         '${dir.path}/myimage.jpg',
//         onReceiveProgress: (count, total) {
//           print('count : ${count}, Total : ${total}');
//           file = '${dir.path}/myimage.jpg';
//           setState(() {
//             downloading = true;
//             progressString = ((count / total) * 100).toStringAsFixed(0) + '%';
//           });
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//     setState(() {
//       downloading = false;
//       progressString = 'Completed';
//     });
//     print("Download completed");
//   }

//   final imgUrl =
//       'https://images.pexels.com/photos/12309507/pexels-photo-12309507.jpeg?cs=srgb&dl=pexels-yelena-odintsova-12309507.jpg&fm=jpg&_gl=1*agdw5e*_ga*MjQyNjAwMzc2LjE2NjgzODg4Mzk.*_ga_8JE65Q40S6*MTY2ODM5MTU5MS4yLjEuMTY2ODM5MTU5NC4wLjAuMA..';

//   bool downloading = false;
//   var progressString = "";
//   var file;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Large File Example'),
//       ),
//       body: Center(
//         child: downloading
//             ? Container(
//                 height: 120,
//                 width: 200,
//                 child: Card(
//                   color: Colors.black,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircularProgressIndicator(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Downloading File : ${progressString}',
//                         style: TextStyle(color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             : FutureBuilder(
//                 future: downloadWidget(file ?? ""),
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   switch (snapshot.connectionState) {
//                     case ConnectionState.none:
//                       print('none');
//                       return Text('데이터 없음');
//                     case ConnectionState.waiting:
//                       print('waiting');
//                       return CircularProgressIndicator();
//                     case ConnectionState.active:
//                       print('active');
//                       return CircularProgressIndicator();
//                     case ConnectionState.done:
//                       print('done');
//                       if (snapshot.hasData) {
//                         return snapshot.data;
//                       }
//                   }
//                   print('end process');
//                   return Text('데이터 없음');
//                 },
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: downloadFile,
//         child: Icon(Icons.file_download),
//       ),
//     );
//   }

//   Future<Widget> downloadWidget(String filePath) async {
//     File file = File(filePath);
//     bool exist = await file.exists();
//     new FileImage(file).evict();

//     if (exist) {
//       return Center(
//         child: Column(children: [Image.file(File(filePath))]),
//       );
//     } else {
//       return Text('No Data');
//     }
//   }
// }
