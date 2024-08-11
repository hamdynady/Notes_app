import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.onpressed,
  });
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 45,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(16)),
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }
}
