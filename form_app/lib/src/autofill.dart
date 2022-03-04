import 'package:flutter/material.dart';

class AutofillDemo extends StatefulWidget {
  const AutofillDemo({Key? key}) : super(key: key);

  @override
  _AutofillDemoState createState() => _AutofillDemoState();
}

class _AutofillDemoState extends State<AutofillDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Autofill')),
        body: Form(
          key: _formKey,
          child: Scrollbar(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: AutofillGroup(
                      child: Column(children: [
                    ...[
                      const Text('自動補完機能を持ったデモです'),
                      TextFormField(
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: 'Nakagawa', labelText: '名字'),
                        autofillHints: const [AutofillHints.familyName],
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Taku',
                          labelText: '氏名',
                        ),
                        autofillHints: const [AutofillHints.givenName],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: 'example@example.com',
                            labelText: 'Email'),
                        autofillHints: const [AutofillHints.email],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          hintText: '07000000000',
                        ),
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.telephoneNumber],
                      ),
                      TextFormField(
                        autofillHints: const [AutofillHints.countryName],
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            labelText: '国', hintText: '日本'),
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: '郵便番号',
                            hintText: '3610032',
                          ),
                          autofillHints: const [AutofillHints.postalCode]),
                    ].expand((element) => [element, const SizedBox(height: 24)])
                  ])))),
        ));
  }
}
