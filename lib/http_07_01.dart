// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: httpApp(),
//     );
//   }
// }

// class httpApp extends StatefulWidget {
//   const httpApp({super.key});

//   @override
//   State<httpApp> createState() => _httpAppState();
// }

// class _httpAppState extends State<httpApp> {
//   String result = '';
//   List? data;
//   TextEditingController? _editingController;
//   ScrollController? _scrollController;
//   int page = 1;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     data = [];
//     _editingController = new TextEditingController();
//     _scrollController = new ScrollController();

//     _scrollController!.addListener(() {
//       if (_scrollController!.offset >=
//               _scrollController!.position.maxScrollExtent &&
//           !_scrollController!.position.outOfRange) {
//         print('bottom');
//         page++;
//         getJSONData();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _editingController,
//           style: TextStyle(color: Colors.white),
//           keyboardType: TextInputType.text,
//           decoration: InputDecoration(hintText: '검색어를 입력하세요'),
//         ),
//       ),
//       body: Container(
//         child: Center(
//           child: data!.isEmpty
//               ? Text(
//                   '데이터가 없습니다.',
//                   style: TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 )
//               : ListView.builder(
//                   itemCount: data!.length,
//                   itemBuilder: ((context, index) {
//                     return Card(
//                       child: Container(
//                           child: Row(
//                         children: [
//                           Image.network(
//                             data![index]['thumbnail'],
//                             height: 100,
//                             width: 100,
//                             fit: BoxFit.contain,
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width - 150,
//                                 child: Text(
//                                   data![index]['title'].toString(),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               Text(data![index]['authors'].toString()),
//                               Text(data![index]['sale_price'].toString()),
//                               Text(data![index]['status'].toString()),
//                             ],
//                           ),
//                         ],
//                       )),
//                     );
//                   }),
//                   controller: _scrollController,
//                 ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // var url = 'http://www.google.com';
//           // var response = await http.get(Uri.parse(url));
//           // setState(() {
//           //   result = response.body;
//           // });
//           getJSONData();
//         },
//         child: Icon(Icons.file_download),
//       ),
//     );
//   }

//   Future<String> getJSONData() async {
//     var url =
//         'https://dapi.kakao.com/v3/search/book?target=title&page=${page}&query=${_editingController?.value.text}';
//     var response = await http.get(Uri.parse(Uri.encodeFull((url))),
//         headers: {"Authorization": "KakaoAK e62e0cb27dcd8e15f5d9a0b4174d92fa"});
//     setState(() {
//       data = [];
//       var dataConvertedToJSON = json.decode(response.body);
//       List result = dataConvertedToJSON['documents'];
//       data!.addAll(result);
//     });
//     // print(response.body);

//     return response.body;
//   }
// }
