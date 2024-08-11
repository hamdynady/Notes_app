import 'package:flutter/material.dart';
import 'package:notes/component/add_note_bottom_sheet.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          elevation: 24,
          shape: const CircleBorder(),
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          ),
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.mic,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 25),
        FloatingActionButton(
          elevation: 24,
          shape: const CircleBorder(),
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          ),
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
