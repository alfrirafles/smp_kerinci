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
          builder: (BuildContext context) => _BaseLayout(content: modalContent),
        ),
      );
    } else {
      modalButton = FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor:
            buttonColor == null ? kModalButtonDefaultColor : buttonColor!,
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => _BaseLayout(content: modalContent),
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

class _BaseLayout extends StatelessWidget {
  const _BaseLayout({
    Key? key,
    required this.content,
  }) : super(key: key);

  final List<Widget>? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width *
              kModalItemsHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content!,
        ),
      ),
    );
  }
}
