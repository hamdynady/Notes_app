import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubit/add_note_cubit/add_note_state.dart';
import 'package:notes/models/note_view_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());
  Color color = Colors.cyan;
  addNote(NoteViewModel notes) async {
    notes.color = color.value;
    emit(AddNoteLoadingState());
    try {
      //Hive.box is generic type so give NoteBoxModel to define its types and not accept any thing except type NoteViewModel
      var notesBox = Hive.box<NoteViewModel>(kNotesBox);
      await notesBox.add(notes);
      emit(AddNoteSuccessState(notes));
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
