import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    this.onTab,
    this.isLoading = false,
    required this.color,
  });

  final String buttonName;
  final VoidCallback? onTab;
  final Color color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : Text(
                    buttonName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  )),
      ),
    );
  }
}
