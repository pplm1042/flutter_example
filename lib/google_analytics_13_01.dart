import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        navigatorObservers: <NavigatorObserver>[observer],
        home: FirebaseApp(analytics: analytics, observer: observer));
  }
}

class FirebaseApp extends StatefulWidget {
  const FirebaseApp(
      {super.key, required this.analytics, required this.observer});

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<FirebaseApp> createState() => _FirebaseAppState();
}

class _FirebaseAppState extends State<FirebaseApp> {
  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<void> _sendAnalyticsEvent() async {
    await widget.analytics
        .logEvent(name: 'test_event', parameters: <String, dynamic>{
      'string': 'hello flutter',
      'int': 100,
    });

    setMessage('Analytics 보내기 성공');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _sendAnalyticsEvent, child: const Text('테스트')),
            Text(
              _message,
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.tab),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            settings: const RouteSettings(name: '/tabs'),
            builder: (context) {
              return TabsPage(observer: widget.observer);
            },
          ));
        },
      ),
    );
  }
}

class TabsPage extends StatefulWidget {
  const TabsPage({required this.observer, super.key});

  final FirebaseAnalyticsObserver? observer;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin, RouteAware {
  TabController? controller;
  int selectedIndex = 0;

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: '1번',
      icon: Icon(Icons.looks_one),
    ),
    const Tab(
      text: '2번',
      icon: Icon(Icons.looks_two),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
        length: tabs.length, vsync: this, initialIndex: selectedIndex);

    controller!.addListener(() {
      setState(() {
        if (selectedIndex != controller!.index) {
          selectedIndex = controller!.index;
          _sendCurrentTab();
        }
      });
    });
  }

  void _sendCurrentTab() async {
    await widget.observer!.analytics
        .setCurrentScreen(screenName: 'tab/$selectedIndex');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    widget.observer!.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.observer!.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: tabs,
          controller: controller,
        ),
      ),
      body: TabBarView(
          controller: controller,
          children:
              tabs.map((Tab tab) => Center(child: Text(tab.text!))).toList()),
    );
  }
}
