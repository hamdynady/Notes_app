import 'package:flutter/material.dart';
import 'package:notes/component/color_item.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_view_model.dart';

class EditColorsList extends StatefulWidget {
  const EditColorsList({super.key, required this.note});
  final NoteViewModel note;
  @override
  State<EditColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<EditColorsList> {
  late int currentColorIndex;
  @override
  void initState() {
    currentColorIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              currentColorIndex = index;
              widget.note.color = kColors[index].value;
              setState(() {});
            },
            child: ColorItem(
              isSelected: currentColorIndex == index,
              color: kColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
