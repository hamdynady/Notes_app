import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/component/custom_app_bar.dart';
import 'package:notes/component/note_list_view.dart';
import '../cubit/note_cubit/note_cubit.dart';

class NoteListViewBody extends StatefulWidget {
  const NoteListViewBody({super.key});

  @override
  State<NoteListViewBody> createState() => _NoteListViewBodyState();
}

class _NoteListViewBodyState extends State<NoteListViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'My Notes',
            icon: Icons.search,
            ontap: () {},
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
