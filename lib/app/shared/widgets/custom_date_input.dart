import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatefulWidget {
  CustomDateInput(
      {Key key,
      this.labelText,
      this.streamSelectedDate,
      this.streamSelectedTime,
      this.selectDate,
      this.selectTime})
      : super(key: key) {
    initializeDateFormatting();
  }

  final String labelText;
  final Stream<DateTime> streamSelectedDate;
  final Stream<TimeOfDay> streamSelectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;

  _CustomDateInputState createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  DateTime selectedDate;
  TimeOfDay selectedTime;

  bool get hasDate => selectedDate != null;
  bool get hasTime => selectedTime != null;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        // locale: Locale.fromSubtags(countryCode: 'BR'),
        firstDate: new DateTime(1970, 8),
        lastDate: new DateTime(2101));
    if (picked != null && picked != selectedDate) widget.selectDate(picked);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) widget.selectTime(picked);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.body1;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: StreamBuilder<DateTime>(
              stream: widget.streamSelectedDate,
              initialData: DateTime.now(),
              builder: (context, snapshot) {
                selectedDate = snapshot.data;
                return _InputDropdown(
                  labelText: widget.labelText,
                  valueText: DateFormat.yMd().format(selectedDate),
                  valueStyle: valueStyle,
                  onPressed: () {
                    _selectDate(context);
                  },
                );
              }),
        ),
        if (hasTime) const SizedBox(width: 12.0),
        if (hasTime)
          new Expanded(
            flex: 3,
            child: StreamBuilder<TimeOfDay>(
                stream: widget.streamSelectedTime,
                initialData: TimeOfDay.now(),
                builder: (context, snapshot) {
                  selectedTime = snapshot.data;
                  return new _InputDropdown(
                    valueText: selectedTime.format(context),
                    valueStyle: valueStyle,
                    onPressed: () {
                      _selectTime(context);
                    },
                  );
                }),
          ),
      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}
