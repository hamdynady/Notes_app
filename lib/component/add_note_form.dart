import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/component/colors_list_view.dart';
import 'package:notes/component/custom_button.dart';
import 'package:notes/component/custom_textfield.dart';
import 'package:notes/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubit/add_note_cubit/add_note_state.dart';
import 'package:notes/models/note_view_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidator = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidator,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            labelText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            labelText: 'Content',
            maxLines: 7,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 15),
          const ColorsList(),
          const SizedBox(height: 20),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => CustomButton(
              buttonName: 'Add',
              isLoading: state is AddNoteLoadingState ? true : false,
              color: Colors.cyan,
              onTab: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  NoteViewModel noteModel = NoteViewModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: DateTime.now().toString(),
                    color: Colors.cyan.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autoValidator = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
