import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'InkWell Demo';
    return MaterialApp(title: title, home: MyHomePage(title: title));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: const Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Hey! Tap!!')));
        },
        child: const Padding(
            padding: const EdgeInsets.all(12.0), child: Text('Flat button')));
  }
}
