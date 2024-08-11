import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/component/add_note_form.dart';
import 'package:notes/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubit/add_note_cubit/add_note_state.dart';
import 'package:notes/cubit/note_cubit/note_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // Adjust for keyboard
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailureState) {}
              if (state is AddNoteSuccessState) {
                BlocProvider.of<NoteCubit>(context).getNotes();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is AddNoteLoadingState ? true : false,
                child: const SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
