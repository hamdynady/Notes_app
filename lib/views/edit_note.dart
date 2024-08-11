import 'package:flutter/material.dart';
import 'package:notes/component/edit_note_view_body.dart';
import 'package:notes/models/note_view_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteViewModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EditNoteViewBody(note: note),
      ),
    );
  }
}
