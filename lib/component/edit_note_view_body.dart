import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/component/custom_app_bar.dart';
import 'package:notes/component/custom_textfield.dart';
import 'package:notes/component/edit_note_color_list.dart';

import 'package:notes/cubit/note_cubit/note_cubit.dart';
import 'package:notes/models/note_view_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteViewModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.done,
            ontap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NoteCubit>(context).getNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 32),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              subTitle = value;
            },
            hint: widget.note.subTitle,
            maxLines: 7,
          ),
          const SizedBox(height: 48),
          EditColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
