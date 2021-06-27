import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class LandingButton extends StatelessWidget {
  final String title;
  final VoidCallback? action;

  LandingButton({required this.title, this.action});

  Color setButtonBackgroundColor(Set<MaterialState> states) {
    if (states.any(kButtonInteractiveStates.contains)) {
      return Colors.green;
    }
    return Colors.transparent;
  }

  Color setButtonForegroundColor(Set<MaterialState> states) {
    if (states.any(kButtonInteractiveStates.contains)) {
      return Colors.white;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('$title'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith(setButtonBackgroundColor),
        foregroundColor:
            MaterialStateProperty.resolveWith(setButtonForegroundColor),
        padding: MaterialStateProperty.resolveWith((states) =>
            EdgeInsets.symmetric(
                vertical: kButtonVerticalPadding,
                horizontal: kButtonHorizontalPadding)),
        side: MaterialStateProperty.resolveWith((states) =>
            BorderSide(style: kButtonBorderStyle, color: kButtonBorderColor)),
      ),
      onPressed: action,
    );
  }
}
