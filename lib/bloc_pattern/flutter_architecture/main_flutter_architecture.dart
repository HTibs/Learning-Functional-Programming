// import 'package:flutter/material.dart';
//
// class MainFlutterArchitecture extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Practice",
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MainFlutterArch(),
//     );
//   }
// }
//
// class MainFlutterArch extends StatefulWidget {
//   @override
//   _MainFlutterArchState createState() => _MainFlutterArchState();
// }
//
// class _MainFlutterArchState extends State<MainFlutterArch> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Hello there"),
//       ),
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text(
//               'You have pushed the button this many times:',
//             ),
//             new Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ),
//     );
//   }
// }
