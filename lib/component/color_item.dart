import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, this.isSelected = false, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}
