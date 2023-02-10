// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoApp(
//         home: CupertinoNativeApp(),
//       );
//     } else {
//       return MaterialApp(
//         title: "Flutter Demo",
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const NativeApp(),
//       );
//     }
//   }
// }

// class CupertinoNativeApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _CupertinoNative();
//   }
// }

// class _CupertinoNative extends State<CupertinoNativeApp> {
//   static const platform = MethodChannel('com.flutter.dev/calc');

//   TextEditingController num1Controller =
//       TextEditingController(text: 0.toString());
//   TextEditingController num2Controller =
//       TextEditingController(text: 0.toString());
//   int? _result;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child: Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CupertinoTextField(
//               controller: num1Controller,
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CupertinoTextField(
//                 controller: num2Controller,
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center),
//             const SizedBox(
//               height: 10,
//             ),
//             CupertinoButton(
//                 child: const Text('더해보기'),
//                 onPressed: () {
//                   _getCalc(
//                       num1Controller.value.text, num2Controller.value.text);
//                 }),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(_result.toString())
//           ],
//         ),
//       ),
//     ));
//   }

//   Future<void> _getCalc(String value1, String value2) async {
//     int result;
//     try {
//       result = await platform
//           .invokeMethod('add', [int.parse(value1), int.parse(value2)]);
//     } on PlatformException {
//       result = -1;
//     }
//     setState(() {
//       _result = result;
//     });
//   }
// }

// class NativeApp extends StatefulWidget {
//   const NativeApp({super.key});

//   @override
//   State<NativeApp> createState() => _NativeAppState();
// }

// class _NativeAppState extends State<NativeApp> {
//   static const platform = MethodChannel('com.flutter.dev/info');
//   static const platform3 = MethodChannel('com.flutter.dev/dialog');
//   String _deviceInfo = "Unknown info";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Native 통신 예제'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 _deviceInfo,
//                 style: const TextStyle(fontSize: 20),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     _showDialog();
//                   },
//                   child: const Text('네이티브 창 열기'))
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _getDeviceInfo();
//         },
//         child: const Icon(Icons.get_app),
//       ),
//     );
//   }

//   Future<void> _getDeviceInfo() async {
//     String deviceInfo;
//     try {
//       final String result = await platform.invokeMethod('getDeviceInfo');
//       deviceInfo = "Device info : $result";
//     } on PlatformException catch (e) {
//       deviceInfo = "Failed to get Device info: '${e.message}'.";
//     }
//     setState(() {
//       _deviceInfo = deviceInfo;
//     });
//   }

//   Future<void> _showDialog() async {
//     try {
//       await platform3.invokeMethod('showDialog');
//     } on PlatformException {}
//   }
// }
