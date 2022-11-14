// import 'package:flutter/cupertino.dart';
// import 'package:flutter_example/main.dart';

// class CupertinoMain extends StatefulWidget {
//   const CupertinoMain({super.key});

//   @override
//   State<CupertinoMain> createState() => _CupertinoMainState();
// }

// class _CupertinoMainState extends State<CupertinoMain> {
//   CupertinoTabBar? tabBar;
//   List<Animal> animalList = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
//       BottomNavigationBarItem(icon: Icon(CupertinoIcons.add))
//     ]);
//     animalList.add(
//         Animal(imagePath: 'repo/images/bee.png', animalName: '벌', kind: '곤충'));
//     animalList.add(Animal(
//         imagePath: 'repo/images/cat.png', animalName: '고양이', kind: '포유류'));
//     animalList.add(Animal(
//         imagePath: 'repo/images/cow.png', animalName: '젖소', kind: '포유류'));
//     animalList.add(
//         Animal(imagePath: 'repo/images/dog.png', animalName: '개', kind: '포유류'));
//     animalList.add(Animal(
//         imagePath: 'repo/images/fox.png', animalName: '여우', kind: '포유류'));
//     animalList.add(Animal(
//         imagePath: 'repo/images/monkey.png', animalName: '원숭이', kind: '영장류'));
//     animalList.add(Animal(
//         imagePath: 'repo/images/pig.png', animalName: '돼지', kind: '포유류'));
//     animalList.add(Animal(
//         imagePath: 'repo/images/wolf.png', animalName: '늑대', kind: '포유류'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       home: CupertinoTabScaffold(
//           tabBar: tabBar!,
//           tabBuilder: ((context, index) {
//             if (index == 0) {
//               return CupertinoFirstPage(
//                 animalList: animalList,
//               );
//             } else {
//               return CupertinoSecondPage(animalList: animalList);
//             }
//           })),
//     );
//   }
// }

// class CupertinoFirstPage extends StatelessWidget {
//   List<Animal>? animalList;
//   CupertinoFirstPage({super.key, required this.animalList});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('동물 리스트'),
//       ),
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.all(5),
//             height: 100,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(
//                       animalList![index].imagePath,
//                       fit: BoxFit.contain,
//                       width: 80,
//                       height: 80,
//                     ),
//                     Text(animalList![index].animalName)
//                   ],
//                 ),
//                 Container(
//                   height: 2,
//                   color: CupertinoColors.black,
//                 )
//               ],
//             ),
//           );
//         },
//         itemCount: animalList!.length,
//       ),
//     );
//   }
// }

// class CupertinoSecondPage extends StatefulWidget {
//   List<Animal>? animalList;
//   CupertinoSecondPage({super.key, required this.animalList});

//   @override
//   State<CupertinoSecondPage> createState() => _CupertinoSecondPageState();
// }

// class _CupertinoSecondPageState extends State<CupertinoSecondPage> {
//   TextEditingController? _textController;
//   int _kindChoice = 0;
//   bool _flyExist = false;
//   String? _imagePath;

//   Map<int, Widget> segmentWidgets = {
//     0: SizedBox(
//       child: Text('양서류', textAlign: TextAlign.center),
//       width: 80,
//     ),
//     1: SizedBox(
//       child: Text('포유류', textAlign: TextAlign.center),
//       width: 80,
//     ),
//     2: SizedBox(
//       child: Text('파충류', textAlign: TextAlign.center),
//       width: 80,
//     )
//   };

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _textController = TextEditingController();
//   }

//   getKind(int radioValue) {
//     switch (radioValue) {
//       case 0:
//         return "양서류";
//       case 1:
//         return "파충류";
//       case 2:
//         return "포유류";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('동물 추가'),
//       ),
//       child: Container(
//         child: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: CupertinoTextField(
//                   controller: _textController,
//                   keyboardType: TextInputType.text,
//                   maxLines: 1,
//                 ),
//               ),
//               CupertinoSegmentedControl(
//                 padding: EdgeInsets.only(bottom: 20, top: 20),
//                 groupValue: _kindChoice,
//                 children: segmentWidgets,
//                 onValueChanged: (value) {
//                   setState(() {
//                     _kindChoice = value;
//                   });
//                 },
//               ),
//               Row(
//                 children: [
//                   Text('날개가 존재합니까'),
//                   CupertinoSwitch(
//                     value: _flyExist,
//                     onChanged: (value) {
//                       setState(() {
//                         _flyExist = value;
//                       });
//                     },
//                   )
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.center,
//               ),
//               SizedBox(
//                 height: 100,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     GestureDetector(
//                       child: Image.asset(
//                         'repo/images/cow.png',
//                         width: 80,
//                       ),
//                       onTap: () {
//                         _imagePath = 'repo/images/cow.png';
//                       },
//                     ),
//                     GestureDetector(
//                       child: Image.asset(
//                         'repo/images/pig.png',
//                         width: 80,
//                       ),
//                       onTap: () {
//                         _imagePath = 'repo/images/pig.png';
//                       },
//                     ),
//                     GestureDetector(
//                       child: Image.asset(
//                         'repo/images/bee.png',
//                         width: 80,
//                       ),
//                       onTap: () {
//                         _imagePath = 'repo/images/bee.png';
//                       },
//                     ),
//                     GestureDetector(
//                       child: Image.asset(
//                         'repo/images/cat.png',
//                         width: 80,
//                       ),
//                       onTap: () {
//                         _imagePath = 'repo/images/cat.png';
//                       },
//                     ),
//                     GestureDetector(
//                       child: Image.asset(
//                         'repo/images/dog.png',
//                         width: 80,
//                       ),
//                       onTap: () {
//                         _imagePath = 'repo/images/dog.png';
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               CupertinoButton(
//                 child: Text('동물 추가하기'),
//                 onPressed: () {
//                   widget.animalList!.add(Animal(
//                       imagePath: _imagePath!,
//                       animalName: _textController!.value.text,
//                       kind: getKind(_kindChoice),
//                       flyExist: _flyExist));
//                 },
//               ),
//             ],
//             mainAxisAlignment: MainAxisAlignment.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // // 그 밖의 쿠퍼티노 위젯

// // CupertinoButton

// // CupertinoActivityIndicator

// // CupertinoAlertDialog

// // CupertinoActionSheet

// // CupertinoPicker

// // CupertinoNavigationBar

// // CupertinoSlider