import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubit/note_cubit/note_states.dart';
import 'package:notes/models/note_view_model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState());

  List<NoteViewModel>? notes;
  void getNotes() {
    var notesBox = Hive.box<NoteViewModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NoteSuccessState());
  }
}
