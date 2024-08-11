import 'package:flutter/material.dart';
import 'package:notes/component/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.icon, required this.title, this.ontap});
  final IconData icon;
  final String title;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        CustomIcon(
          onpressed: ontap,
          icon: icon,
        )
      ],
    );
  }
}
