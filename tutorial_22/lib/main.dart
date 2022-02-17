import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismiss Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$item dismissed')));
                  },
                  background: Container(
                      color: Colors.blue,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: Icon(Icons.thumb_up, color: Colors.white))),
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              })),
    );
  }
}