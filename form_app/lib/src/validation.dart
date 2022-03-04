import 'package:english_words/english_words.dart' as english_words;
import 'package:flutter/material.dart';

class FormValidationsDemo extends StatefulWidget {
  const FormValidationsDemo({Key? key}) : super(key: key);

  @override
  _FormValidationsDemoState createState() => _FormValidationsDemoState();
}

class _FormValidationsDemoState extends State<FormValidationsDemo> {
  final _formKey = GlobalKey<FormState>();
  String? adjective;
  String? noun;
  bool? agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Story Generator'), actions: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.white),
                  child: const Text('Submit'),
                  onPressed: () {
                    var valid = _formKey.currentState!.validate();
                    if (!valid) {
                      return;
                    }
                    showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: const Text('Your story'),
                                content: Text(
                                    'The $adjective developer saw a $noun'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('キャンセル'))
                                ]));
                  }))
        ]),
        body: Form(
            key: _formKey,
            child: Scrollbar(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      TextFormField(
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an adjective.';
                            }
                            if (english_words.adjectives.contains(value)) {
                              return null;
                            }
                            return 'Not a valid adjective';
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'beautiful, interesting',
                            labelText: 'Enter an adjective',
                          ),
                          onChanged: (value) {
                            adjective = value;
                          }),
                      const SizedBox(height: 24),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a noun';
                            }
                            if (english_words.nouns.contains(value)) {
                              return null;
                            }
                            return 'Not a valid noun';
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Person, Place or Things',
                            labelText: 'Enter a noun',
                          ),
                          onChanged: (value) {
                            noun = value;
                          }),
                      const SizedBox(height: 24),
                      FormField<bool>(
                          initialValue: false,
                          validator: (value) {
                            if (value == false) {
                              return 'Agree to the terms of services';
                            }
                            return null;
                          },
                          builder: (formFieldState) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Checkbox(
                                      value: agreeToTerms,
                                      onChanged: (value) {
                                        formFieldState.didChange(value);
                                        setState(() {
                                          agreeToTerms = value;
                                        });
                                      },
                                    ),
                                    Text('I agree to the terms of services',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1)
                                  ]),
                                  if (!formFieldState.isValid)
                                    Text(formFieldState.errorText ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .errorColor))
                                ]);
                          })
                    ])))));
  }
}
