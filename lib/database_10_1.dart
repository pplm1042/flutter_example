// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:path/path.dart';

// import 'package:sqflite/sqflite.dart';

// class Todo {
//   String? title;
//   String? content;
//   bool? active;
//   int? id;

//   Todo({this.title, this.content, this.active, this.id});

//   Map<String, dynamic> toMap() {
//     return {'id': id, 'title': title, 'content': content, 'active': active};
//   }
// }

// class MyDatabaseApp extends StatelessWidget {
//   const MyDatabaseApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Future<Database> database = initDatabase();

//     return MaterialApp(
//       // home: DatabaseApp(),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => DatabaseApp(database),
//         '/add': (context) => AddTodoApp(database),
//         '/clear': (context) => ClearListApp(database),
//       },
//     );
//   }

//   Future<Database> initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'todo_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, "
//           "title TEXT, content TEXT, active BOOL)",
//         );
//       },
//       version: 1,
//     );
//   }
// }

// class DatabaseApp extends StatefulWidget {
//   final Future<Database> db;

//   DatabaseApp(this.db);

//   @override
//   State<DatabaseApp> createState() => _DatabaseAppState();
// }

// class _DatabaseAppState extends State<DatabaseApp> {
//   Future<List<Todo>>? todoList;

//   @override
//   void initState() {
//     super.initState();
//     todoList = getTodos();
//   }

//   Future<List<Todo>> getTodos() async {
//     final Database database = await widget.db;
//     final List<Map<String, dynamic>> maps = await database.query('todos');

//     return List.generate(maps.length, (i) {
//       bool active = maps[i]['active'] == 1 ? true : false;
//       return Todo(
//           title: maps[i]['title'].toString(),
//           content: maps[i]['content'].toString(),
//           active: active,
//           id: maps[i]['id']);
//     });
//   }

//   void _insertTodo(Todo todo) async {
//     final Database database = await widget.db;
//     await database.insert('todos', todo.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);

//     setState(() {
//       todoList = getTodos();
//     });
//   }

//   void _updateTodo(Todo todo) async {
//     final Database database = await widget.db;
//     await database
//         .update('todos', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
//     setState(() {
//       todoList = getTodos();
//     });
//   }

//   void _deleteTodo(Todo todo) async {
//     final Database database = await widget.db;
//     await database.delete('todos', where: 'id=?', whereArgs: [todo.id]);
//     setState(() {
//       todoList = getTodos();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Database Example'),
//         actions: [
//           ElevatedButton(
//             onPressed: () async {
//               await Navigator.of(context).pushNamed('/clear');
//               setState(() {
//                 todoList = getTodos();
//               });
//             },
//             child: const Text(
//               '완료할 일',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         child: Center(
//           child: FutureBuilder(
//             builder: (context, snapshot) {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                   return CircularProgressIndicator();
//                 case ConnectionState.waiting:
//                   return CircularProgressIndicator();
//                 case ConnectionState.active:
//                   return CircularProgressIndicator();
//                 case ConnectionState.done:
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                       itemBuilder: (context, index) {
//                         Todo todo = snapshot.data![index];
//                         return ListTile(
//                           title:
//                               Text(todo.title!, style: TextStyle(fontSize: 20)),
//                           subtitle: Container(
//                             child: Column(
//                               children: [
//                                 Text(todo.content!),
//                                 Text('체크 : ${todo.active.toString()}'),
//                                 Container(
//                                   height: 1,
//                                   color: Colors.blue,
//                                 )
//                               ],
//                             ),
//                           ),
//                           onTap: () async {
//                             TextEditingController controller =
//                                 new TextEditingController(text: todo.content);

//                             Todo? result = await showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     title: Text('${todo.id} : ${todo.title}'),
//                                     content: TextField(
//                                       controller: controller,
//                                       keyboardType: TextInputType.text,
//                                     ),
//                                     actions: [
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               todo.active == true
//                                                   ? todo.active = false
//                                                   : todo.active = true;
//                                               todo.content =
//                                                   controller.value.text;
//                                             });

//                                             Navigator.of(context).pop(todo);
//                                           },
//                                           child: Text('예')),
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: Text('아니요')),
//                                     ],
//                                   );
//                                 });
//                             if (result != null) {
//                               _updateTodo(result);
//                             }
//                           },
//                           onLongPress: () async {
//                             Todo? result = await showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     title: Text('${todo.id} : ${todo.title}'),
//                                     content: Text('${todo.content}를 삭제하시겠습니까?'),
//                                     actions: [
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.of(context).pop(todo);
//                                           },
//                                           child: Text('예')),
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: Text('아니요')),
//                                     ],
//                                   );
//                                 });
//                             if (result != null) {
//                               _deleteTodo(result);
//                             }
//                           },
//                         );
//                       },
//                       itemCount: snapshot.data!.length,
//                     );
//                   } else {
//                     return Text('No data');
//                   }
//               }
//               return CircularProgressIndicator();
//             },
//             future: todoList,
//           ),
//         ),
//       ),
//       floatingActionButton: Column(
//         children: [
//           FloatingActionButton(
//             onPressed: () async {
//               final todo =
//                   await Navigator.of(context).pushNamed('/add') as Todo;
//               if (todo != null) {
//                 _insertTodo(todo);
//               }
//             },
//             heroTag: null,
//             child: Icon(Icons.add),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton(
//             onPressed: () async {
//               _allUpdate();
//             },
//             heroTag: null,
//             child: Icon(Icons.update),
//           ),
//         ],
//         mainAxisAlignment: MainAxisAlignment.end,
//       ),
//     );
//   }

//   void _allUpdate() async {
//     final Database database = await widget.db;
//     await database.rawUpdate('update todos set active = 1 where active = 0');
//     setState(() {
//       todoList = getTodos();
//     });
//   }
// }

// class AddTodoApp extends StatefulWidget {
//   final Future<Database> db;
//   AddTodoApp(this.db);

//   @override
//   State<AddTodoApp> createState() => _AddTodoAppState();
// }

// class _AddTodoAppState extends State<AddTodoApp> {
//   TextEditingController? titleController;
//   TextEditingController? contentController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     titleController = new TextEditingController();
//     contentController = new TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Todo 추가')),
//       body: Container(
//         child: Center(
//             child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: '제목'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 controller: contentController,
//                 decoration: InputDecoration(labelText: '할일'),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Todo todo = Todo(
//                     title: titleController!.value.text,
//                     content: contentController!.value.text,
//                     active: false);
//                 Navigator.of(context).pop(todo);
//               },
//               child: Text('저장하기'),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

// class ClearListApp extends StatefulWidget {
//   Future<Database> database;
//   ClearListApp(this.database);

//   @override
//   State<ClearListApp> createState() => _ClearListAppState();
// }

// class _ClearListAppState extends State<ClearListApp> {
//   Future<List<Todo>>? clearList;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     clearList = getClearList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('완료한 일')),
//       body: Container(
//           child: Center(
//         child: FutureBuilder(
//           future: clearList,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                   return CircularProgressIndicator();
//                 case ConnectionState.waiting:
//                   return CircularProgressIndicator();
//                 case ConnectionState.active:
//                   return CircularProgressIndicator();
//                 case ConnectionState.done:
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                       itemBuilder: (context, index) {
//                         Todo todo = snapshot.data![index];
//                         return ListTile(
//                           title: Text(todo.title ?? "",
//                               style: const TextStyle(fontSize: 20)),
//                           subtitle: Container(
//                             child: Column(
//                               children: [
//                                 Text(todo.content ?? ""),
//                                 Container(
//                                   height: 1,
//                                   color: Colors.blue,
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       itemCount: snapshot.data!.length,
//                     );
//                   } else {
//                     return Text('No data');
//                   }
//               }
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final result = await showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('완료한 일 삭제'),
//                   content: Text('완료한 일을 모두 삭제할까요?'),
//                   actions: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(true);
//                       },
//                       child: Text('예'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(false);
//                       },
//                       child: Text('아니요'),
//                     ),
//                   ],
//                 );
//               });
//           if (result == true) {
//             _removeAllTodos();
//           }
//         },
//         child: Icon(Icons.remove),
//       ),
//     );
//   }

//   void _removeAllTodos() async {
//     final Database database = await widget.database;
//     database.rawDelete('delete from todos where active=1');
//     setState(() {
//       clearList = getClearList();
//     });
//   }

//   Future<List<Todo>> getClearList() async {
//     final Database database = await widget.database;
//     List<Map<String, dynamic>> maps = await database
//         .rawQuery('select title, content, id from todos where active=1');

//     return List.generate(maps.length, (i) {
//       return Todo(
//           title: maps[i]['title'].toString(),
//           content: maps[i]['content'].toString(),
//           id: maps[i]['id']);
//     });
//   }
// }
