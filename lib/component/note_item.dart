import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubit/note_cubit/note_cubit.dart';
import 'package:notes/models/note_view_model.dart';
import 'package:notes/views/edit_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteViewModel note;

  @override
  Widget build(BuildContext context) {
    DateTime parseDate = DateTime.parse(note.date);
    String formattedDate = DateFormat('MMMM dd, yyyy').format(parseDate);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(
              note: note,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  note.subTitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
              trailing: IconButton(
                color: Colors.black,
                onPressed: () {
                  //delete function come from hive object
                  //we make our noteModel extends hive object
                  note.delete();
                  //after delete the note just call the note list to refresh the page
                  BlocProvider.of<NoteCubit>(context).getNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, right: 32),
              child: Text(
                formattedDate,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
