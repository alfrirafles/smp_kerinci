import 'package:flutter/material.dart';

class CreateItemModal extends StatelessWidget {
  final Color? buttonColor;
  final String? buttonDescription;
  final List<Widget>? modalContent;

  CreateItemModal(
      {this.buttonColor, this.buttonDescription, required this.modalContent});

  @override
  Widget build(BuildContext context) {
    Widget modalButton;

    if (buttonDescription != null) {
      modalButton = FloatingActionButton.extended(
        backgroundColor: buttonColor == null ? Colors.blue : buttonColor!,
        label: Text(
          buttonDescription!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.add),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: modalContent!),
          ),
        ),
      );
    } else {
      modalButton = FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: buttonColor == null ? Colors.blue : buttonColor!,
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: modalContent!),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 20, right: 20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: modalButton,
      ),
    );
  }
}