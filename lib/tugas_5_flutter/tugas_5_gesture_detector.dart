import 'package:flutter/material.dart';

class Tugas5GestureDetector extends StatelessWidget {
  const Tugas5GestureDetector({
    super.key,
    required this.data,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });
  final String data;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(12),
        child: Container(
          width: 120,
          height: 60,
          color: Colors.cyanAccent,
          child: Center(child: Text(data, textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}
