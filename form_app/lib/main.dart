import 'package:flutter/material.dart';

import 'src/autofill.dart';
import 'src/form_widgets.dart';
import 'src/mock_client.dart';
import 'src/sign_in_http.dart';
import 'src/validation.dart';

void main() {
  runApp(const FormApp());
}

final demos = [
  Demo(
      name: 'Sign in with HTTP',
      route: '/signin_http',
      builder: (context) => SignInHttpDemo(
            httpClient: mockClient,
          )),
  Demo(
      name: 'Auto Fill',
      route: '/autofill',
      builder: (context) => const AutofillDemo()),
  Demo(
      name: 'Form Widget',
      route: '/form_widgets',
      builder: (context) => const FormWidgetsDemo()),
  Demo(
      name: 'Validations',
      route: '/validation',
      builder: (context) => const FormValidationsDemo()),
];

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({required this.name, required this.route, required this.builder});
}

class FormApp extends StatelessWidget {
  const FormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Samples',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: Map.fromEntries(demos.map((d) => MapEntry(d.route, d.builder))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Form Samples')),
        body: ListView(
          children: [...demos.map((d) => DemoTile(demo: d))],
        ));
  }
}

class DemoTile extends StatelessWidget {
  final Demo? demo;
  const DemoTile({this.demo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(demo!.name),
        onTap: () {
          Navigator.pushNamed(context, demo!.route);
        });
  }
}
