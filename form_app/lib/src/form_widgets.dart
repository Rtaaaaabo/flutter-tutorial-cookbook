import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart';

class FormWidgetsDemo extends StatefulWidget {
  const FormWidgetsDemo({Key? key}) : super(key: key);

  @override
  _FormWidgetsDemoState createState() => _FormWidgetsDemoState();
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enabledFeature = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ja_JP');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Form widgets')),
        body: Form(
          key: _formKey,
          child: Scrollbar(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 400),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ...[
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          filled: true,
                                          hintText: 'Enter a title...',
                                          labelText: 'Title',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            title = value;
                                          });
                                        },
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          filled: true,
                                          hintText: 'Enter a description',
                                          labelText: 'Description',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            description = value;
                                          });
                                        },
                                        maxLines: 6,
                                      ),
                                      _FormDatePicker(
                                          date: date,
                                          onChanged: (value) {
                                            setState(() {
                                              date = value;
                                            });
                                          }),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Estimated value',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            intl.NumberFormat.currency(
                                                    symbol: "\$",
                                                    decimalDigits: 0)
                                                .format(maxValue),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                          Slider(
                                            min: 0,
                                            max: 500,
                                            divisions: 500,
                                            value: maxValue,
                                            onChanged: (value) {
                                              setState(() {
                                                maxValue = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: brushedTeeth,
                                            onChanged: (value) {
                                              setState(() {
                                                brushedTeeth = value;
                                              });
                                            },
                                          ),
                                          Text('Check!! Brushed Teeth',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Enable feature',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                            Switch(
                                                value: enabledFeature,
                                                onChanged: (enabled) {
                                                  setState(() {
                                                    enabledFeature = enabled;
                                                  });
                                                })
                                          ])
                                    ].expand((element) =>
                                        [element, const SizedBox(height: 24)])
                                  ])))))),
        ));
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('日付', style: Theme.of(context).textTheme.bodyText1),
              Text(intl.DateFormat.yMMMd('ja').format(widget.date))
            ]),
        ElevatedButton(
            child: const Text('Edit'),
            onPressed: () async {
              var newDate = await showDatePicker(
                  context: context,
                  initialDate: widget.date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if (newDate == null) {
                return;
              }
              widget.onChanged(newDate);
            })
      ],
    );
  }
}
