// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return const CupertinoApp(
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
//   const CupertinoNativeApp({super.key});

//   @override
//   State<CupertinoNativeApp> createState() => _CupertinoNativeAppState();
// }

// class _CupertinoNativeAppState extends State<CupertinoNativeApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class NativeApp extends StatefulWidget {
//   const NativeApp({super.key});

//   @override
//   State<NativeApp> createState() => _NativeAppState();
// }

// class _NativeAppState extends State<NativeApp> {
//   static const platform = MethodChannel('com.flutter.dev/info');
//   String _deviceInfo = "Unknown info";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Native 통신 예제'),
//       ),
//       body: Container(
//         child: Center(
//           child: Text(
//             _deviceInfo,
//             style: const TextStyle(fontSize: 20),
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
// }
