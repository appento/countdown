import 'package:flutter/material.dart';

class HyperlinkButton extends StatelessWidget {
  const HyperlinkButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(decoration: TextDecoration.underline),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
