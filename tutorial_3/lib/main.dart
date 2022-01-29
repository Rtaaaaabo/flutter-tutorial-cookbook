import 'package:flutter/material.dart';

void main() => runApp(const SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar demo'),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        final snackBar = SnackBar(
            content: const Text('Success SnackBar!'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                // Navigator.pop(context);
              },
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('Show Snackbar!!!'),
    ));
  }
}
