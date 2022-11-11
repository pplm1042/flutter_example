// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
import 'package:flutter_example/cupertino_main.dart';

class FirstApp extends StatelessWidget {
  List<Animal>? list;
  FirstApp({super.key, this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '이 동물은 ${list![index].kind}입니다',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                  showDialog(context: context, builder: ((context) => dialog));
                },
                child: Card(
                  child: Row(children: [
                    Image.asset(
                      list![index].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(list![index].animalName),
                  ]),
                ),
              );
            },
            itemCount: list!.length,
          ),
        ),
      ),
    );
  }
}

class SecondApp extends StatefulWidget {
  List<Animal>? list;
  SecondApp({super.key, this.list});

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  Text('양서류'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  Text('파충류'),
                  Radio(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  Text('포유류'),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                children: [
                  Text('날 수 있나요?'),
                  Checkbox(
                      value: flyExist,
                      onChanged: (check) {
                        setState(() {
                          flyExist = check ?? false;
                        });
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              // Row(
              //   children: [
              //     GestureDetector(
              //       child: Image.asset(
              //         'repo/images/cow.png',
              //         width: 80,
              //       ),
              //       onTap: () {
              //         _imagePath = 'repo/images/cow.png';
              //       },
              //     ),
              //     GestureDetector(
              //       child: Image.asset(
              //         'repo/images/pig.png',
              //         width: 80,
              //       ),
              //       onTap: () {
              //         _imagePath = 'repo/images/pig.png';
              //       },
              //     ),
              //     GestureDetector(
              //       child: Image.asset(
              //         'repo/images/bee.png',
              //         width: 80,
              //       ),
              //       onTap: () {
              //         _imagePath = 'repo/images/bee.png';
              //       },
              //     ),
              //     GestureDetector(
              //       child: Image.asset(
              //         'repo/images/cat.png',
              //         width: 80,
              //       ),
              //       onTap: () {
              //         _imagePath = 'repo/images/cat.png';
              //       },
              //     ),
              //     // GestureDetector(
              //     //   child: Image.asset(
              //     //     'repo/images/dog.png',
              //     //     width: 80,
              //     //   ),
              //     //   onTap: () {
              //     //     _imagePath = 'repo/images/dog.png';
              //     //   },
              //     // ),
              //   ],
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'repo/images/cow.png',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'repo/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'repo/images/pig.png',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'repo/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'repo/images/bee.png',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'repo/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'repo/images/cat.png',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'repo/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'repo/images/dog.png',
                        width: 80,
                      ),
                      onTap: () {
                        _imagePath = 'repo/images/dog.png';
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var animal = Animal(
                        imagePath: _imagePath ?? 'repo/images/dog.png',
                        animalName: nameController.value.text,
                        kind: getKind(_radioValue),
                        flyExist: flyExist);

                    AlertDialog dialog = AlertDialog(
                      title: Text('동물 추가하기'),
                      content: Text(
                        '이 동물은 ${animal.animalName} 입니다'
                        '또 동물의 종류는 ${animal.kind}입니다. \n 이 동물을 추가하시겠습니까?',
                        style: TextStyle(fontSize: 30),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              widget.list!.add(animal);
                              Navigator.of(context).pop();
                            },
                            child: Text('예')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('아니요'))
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog);
                  },
                  child: Text('동물 추가하기'))
            ],
          ),
        ),
      ),
    );
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }

  void _radioChange(int? value) {
    setState(() {
      _radioValue = value ?? 0;
    });
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
  List<Animal> animalList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: [
          FirstApp(
            list: animalList,
          ),
          SecondApp(list: animalList)
        ],
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

    animalList.add(
        Animal(imagePath: 'repo/images/bee.png', animalName: '벌', kind: '곤충'));
    animalList.add(Animal(
        imagePath: 'repo/images/cat.png', animalName: '고양이', kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'repo/images/cow.png', animalName: '젖소', kind: '포유류'));
    animalList.add(
        Animal(imagePath: 'repo/images/dog.png', animalName: '개', kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'repo/images/fox.png', animalName: '여우', kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'repo/images/monkey.png', animalName: '원숭이', kind: '영장류'));
    animalList.add(Animal(
        imagePath: 'repo/images/pig.png', animalName: '돼지', kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'repo/images/wolf.png', animalName: '늑대', kind: '포유류'));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

void main() {
  runApp(CupertinoMain());
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

class Animal {
  String imagePath;
  String animalName;
  String kind;
  bool? flyExist = false;
  Animal({
    required this.imagePath,
    required this.animalName,
    required this.kind,
    this.flyExist,
  });

  Animal copyWith({
    String? imagePath,
    String? animalName,
    String? kind,
    bool? flyExist,
  }) {
    return Animal(
      imagePath: imagePath ?? this.imagePath,
      animalName: animalName ?? this.animalName,
      kind: kind ?? this.kind,
      flyExist: flyExist ?? this.flyExist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'animalName': animalName,
      'kind': kind,
      'flyExist': flyExist,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      imagePath: map['imagePath'] as String,
      animalName: map['animalName'] as String,
      kind: map['kind'] as String,
      flyExist: map['flyExist'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) =>
      Animal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Animal(imagePath: $imagePath, animalName: $animalName, kind: $kind, flyExist: $flyExist)';
  }

  @override
  bool operator ==(covariant Animal other) {
    if (identical(this, other)) return true;

    return other.imagePath == imagePath &&
        other.animalName == animalName &&
        other.kind == kind &&
        other.flyExist == flyExist;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        animalName.hashCode ^
        kind.hashCode ^
        flyExist.hashCode;
  }
}
