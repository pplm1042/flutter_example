import 'package:flutter/material.dart';

// // 02-4-1 스트림 통신하기
// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   await for (var value in stream) {
//     print('sumStream : ${value}');
//     sum += value;
//   }
//   return sum;
// }

// Stream<int> countStream(int to) async* {
//   for (int i = 0; i <= to; i++) {
//     print('countStream : $i');
//     yield i;
//   }
// }

// void main() async {
//   var stream = countStream(10);
//   var sum = await sumStream(stream);
//   print(sum);
// }

// // 02-4-2 스트림 통신하기

// void main() async {
//   var stream = Stream.fromIterable([1, 2, 3, 4, 5]);

//   stream.first.then((value) => print('first: $value'));

//   stream.last.then((value) => print('last: $value'));

//   stream.isEmpty.then((value) => print('isEmpty: $value'));

//   stream.length.then((value) => print('length : $value'));
// }

// // // 02-5-1 자동차 클래스 구현하기

// class Car {
//   int? maxSpeed;
//   num? price;
//   String? name;

//   Car(int this.maxSpeed, num this.price, String this.name);

//   num? saleCar() {
//     price = price! * 0.9;
//     return price;
//   }
// }

// void main() {
//   Car bmw = Car(320, 100000, 'BMW');
//   Car toyota = Car(250, 70000, 'toyota');
//   Car formd = Car(200, 80000, 'formd');

//   bmw.saleCar();
//   bmw.saleCar();
//   bmw.saleCar();

//   print(bmw.price);
// }

// // 02-5-2 로또 번호 생성기 만들기
// import 'dart:math' as math;
// import 'dart:collection';

// void main() {
//   var rand = math.Random();
//   HashSet<int> lotteryNumber = HashSet();

//   while (lotteryNumber.length < 6) {
//     lotteryNumber.add(rand.nextInt(45));
//   }
//   print(lotteryNumber);
// }

// // 03-2-1 위젯의 생명 주기
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() {
//     print('createState');
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     print('initState');
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     print('didChangeDependencies');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build');
//     return Container();
//   }
// }

// // 04-3-1 계산기 앱 만들기
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static const String _title = 'Widget Example';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: WidgetApp(),
//     );
//   }
// }

// class WidgetApp extends StatefulWidget {
//   const WidgetApp({super.key});

//   @override
//   State<WidgetApp> createState() => _WidgetAppState();
// }

// class _WidgetAppState extends State<WidgetApp> {
//   String sum = '';
//   TextEditingController value1 = TextEditingController();
//   TextEditingController value2 = TextEditingController();
//   List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
//   List<DropdownMenuItem<String>> _dropDownMenuItems = [];
//   String? _buttonText;

//   @override
//   void initState() {
//     super.initState();
//     for (var item in _buttonList) {
//       _dropDownMenuItems.add(DropdownMenuItem(
//         value: item,
//         child: Text(item),
//       ));
//     }
//     _buttonText = _dropDownMenuItems[0].value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Widget Example'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   '결과 : ${sum}',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: TextField(
//                   controller: value1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: TextField(
//                   controller: value2,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         var value1Int = double.parse(value1.value.text);
//                         var value2Int = double.parse(value2.value.text);
//                         var result;
//                         if (_buttonText == '더하기') {
//                           result = value1Int + value2Int;
//                         } else if (_buttonText == '빼기') {
//                           result = value1Int - value2Int;
//                         } else if (_buttonText == '곱하기') {
//                           result = value1Int * value2Int;
//                         } else {
//                           result = value1Int / value2Int;
//                         }
//                         sum = '$result';
//                       });
//                     },
//                     child: Row(
//                       children: [Icon(Icons.add), Text(_buttonText ?? "")],
//                     )),
//               ),
//               DropdownButton(
//                 items: _dropDownMenuItems,
//                 onChanged: (value) {
//                   setState(() {
//                     _buttonText = value;
//                   });
//                 },
//                 value: _buttonText,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// 05-1 탭바로 화면 이동하기
import 'package:flutter/material.dart';

class FistApp extends StatelessWidget {
  const FistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('첫 번째 페이지'),
        ),
      ),
    );
  }
}

class SecondApp extends StatelessWidget {
  const SecondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('두 번째 페이지'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: [FistApp(), SecondApp()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.blue,
            ),
          ),
        ],
        controller: controller,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(() {
      if (controller!.indexIsChanging) {
        print('이전 index, ${controller!.previousIndex}');
        print('현재 index, ${controller!.index}');
      }
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}
