import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    Key? key,
    required DateTime initialDateDisplay,
  })  : _pickedDate = initialDateDisplay,
        super(key: key);

  final DateTime _pickedDate;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            width: kDatePickerButtonBorderWidth,
            color: kDatePickerButtonBorderColor,
          ),
        ),
        padding: MaterialStateProperty.all(
          kDatePickerButtonPadding,
        ),
        foregroundColor: MaterialStateProperty.all(
          kDatePickerButtonTextColor,
        ),
      ),
      child: Text(
        '${_pickedDate.day}' +
            '/' +
            '${_pickedDate.month}' +
            '/' +
            '${_pickedDate.year}',
      ),
      onPressed: () {},
    );
  }
}
