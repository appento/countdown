import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class TimeColumn extends StatelessWidget {
  const TimeColumn(
      {super.key, required this.eventTimestamp, required this.now});

  final DateTime eventTimestamp;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    const double elementHeight = 143; // determined with flutter inspector
    const double shiftHeight = elementHeight * 0.85;

    Duration difference = eventTimestamp.difference(now);

    if(difference.isNegative) {
      // difference = now.difference(eventTimestamp); // uncomment this line to show the time since the event
      difference = Duration.zero;
    }

    bool showYears = difference.inDays > 365;
    int years = showYears ? difference.inDays ~/ 365 : 0;
    int days = showYears ? difference.inDays % 365 : difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    return SizedBox(
      height: elementHeight + (3 + (showYears ? 1 : 0)) * shiftHeight,
      child: Stack(
        children: [
          if (showYears)
            Positioned(
              top: 0,
              child: NumberFlipCounter(
                value: years,
                label: S.of(context).years,
              ),
            ),
          Positioned(
            top: 0 * shiftHeight + (showYears ? shiftHeight : 0),
            child: NumberFlipCounter(
              value: days,
              label: S.of(context).days,
            ),
          ),
          Positioned(
            top: 1 * shiftHeight + (showYears ? shiftHeight : 0),
            child: NumberFlipCounter(
              value: hours,
              label: S.of(context).hours,
            ),
          ),
          Positioned(
            top: 2 * shiftHeight + (showYears ? shiftHeight : 0),
            child: NumberFlipCounter(
              value: minutes,
              label: S.of(context).minutes,
            ),
          ),
          Positioned(
            top: 3 * shiftHeight + (showYears ? shiftHeight : 0),
            child: NumberFlipCounter(
              value: seconds,
              label: S.of(context).seconds,
            ),
          ),
        ],
      ),
    );
  }
}

class NumberFlipCounter extends StatelessWidget {
  const NumberFlipCounter(
      {super.key, required this.value, required this.label});

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          AnimatedFlipCounter(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            value: value,
            textStyle: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(label,
                  style: const TextStyle(
                    fontSize: 22,
                  ))),
        ],
      ),
    );
  }
}
