import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/component/note_item.dart';
import 'package:notes/cubit/note_cubit/note_cubit.dart';
import 'package:notes/cubit/note_cubit/note_states.dart';
import 'package:notes/models/note_view_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {
        List<NoteViewModel> notes =
            BlocProvider.of<NoteCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) => NoteItem(note: notes[index]),
          ),
        );
      },
    );
  }
}
