import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class CreateItemModal extends StatelessWidget {
  final Color? buttonColor;
  final String? buttonDescription;
  final List<Widget>? modalContent;

  CreateItemModal({
    this.buttonColor,
    this.buttonDescription,
    required this.modalContent,
  });

  @override
  Widget build(BuildContext context) {
    Widget modalButton;

    if (buttonDescription != null) {
      modalButton = FloatingActionButton.extended(
        backgroundColor:
            buttonColor == null ? kModalButtonDefaultColor : buttonColor!,
        label: Text(
          buttonDescription!,
          style: kModalButtonTextStyle,
        ),
        icon: Icon(Icons.add),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: modalContent!,
            ),
          ),
        ),
      );
    } else {
      modalButton = FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor:
            buttonColor == null ? kModalButtonDefaultColor : buttonColor!,
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: modalContent!,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: kModalButtonPadding,
      child: Align(
        alignment: Alignment.bottomRight,
        child: modalButton,
      ),
    );
  }
}
