import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../generated/l10n.dart';
import '../../utils/colors.dart';

/// A simple color picker that allows the user to select from a predefined set of colors displayed in a row.
/// The last "color" is a custom color picker that opens a dialog to select any color.
class ColorPickerRow extends StatelessWidget {
  const ColorPickerRow(
      {super.key, required this.onColorChanged, required this.selectedColor});

  final void Function(Color) onColorChanged;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    final colors = [
      ColorConstants.brightPinkCrayola,
      ColorConstants.sunglow,
      ColorConstants.emerald,
      ColorConstants.blueNcs,
      ColorConstants.midnightGreen
    ];

    // TODO: using a row here is not ideal, as it might overflow on smaller screens
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ...colors.map((c) => ColorPickerElement(
          onTap: onColorChanged, color: c, isSelected: c == selectedColor)),
      ColorPickerElement(
        onTap: (_) => showCustomColorPicker(context),
        color: selectedColor,
        isSelected: !colors.contains(selectedColor),
        gradient: const LinearGradient(
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.orange,
            Colors.red,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      )
    ]);
  }

  void showCustomColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (c) => onColorChanged(c),
              enableAlpha: false,
              hexInputBar: true,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(S.of(context).done),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class ColorPickerElement extends StatelessWidget {
  const ColorPickerElement(
      {super.key,
      required this.onTap,
      required this.color,
      required this.isSelected,
      this.gradient});

  final void Function(Color) onTap;
  final Color color;
  final Gradient? gradient;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap(color);
        },
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 1),
                ),
              ],
              color: color,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 3,
              ),
            )));
  }
}
