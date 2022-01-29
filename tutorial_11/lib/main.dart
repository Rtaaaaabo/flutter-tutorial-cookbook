import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
      items: List<ListItem>.generate(
          1000,
          (i) => i % 6 == 0
              ? HeadingItem('Headinging $i')
              : MessageItem('Sender $i', 'Message body $i'))));
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;
  const MyApp({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';
    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(title: Text(title)),
            body: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                      title: item.buildTitle(context),
                      subtitle: item.buildSubTitle(context));
                })));
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headline5);
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class MessageItem extends ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubTitle(BuildContext context) => Text(body);
}
