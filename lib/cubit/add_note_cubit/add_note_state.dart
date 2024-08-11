import 'package:notes/models/note_view_model.dart';

abstract  class AddNoteState{}
class AddNoteInitialState extends AddNoteState{}
class AddNoteLoadingState extends AddNoteState{}
class AddNoteSuccessState extends AddNoteState{
  final NoteViewModel? noteViewModel;

  AddNoteSuccessState( this.noteViewModel);
}
class AddNoteFailureState extends AddNoteState{
  final String error;
  AddNoteFailureState(this.error);
}
