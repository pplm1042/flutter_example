import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SendDataExample(),
    );
  }
}

class SendDataExample extends StatefulWidget {
  const SendDataExample({super.key});

  @override
  State<SendDataExample> createState() => _SendDataExampleState();
}

class _SendDataExampleState extends State<SendDataExample> {
  static const platform = MethodChannel('com.flutter.dev/encrypt');

  TextEditingController controller = TextEditingController();
  String _changeText = 'Nothing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Data Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _changeText,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendData(controller.value.text);
        },
        child: const Text('변환'),
      ),
    );
  }

  Future<void> _sendData(String text) async {
    final String result = await platform.invokeMethod('getEncrypt', text);
    print(result);
    setState(() {
      _changeText = result;
    });
  }
}
