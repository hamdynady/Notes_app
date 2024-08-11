import 'package:flutter/material.dart';
import 'package:notes/component/custom_floating_button.dart';

import 'package:notes/component/note_list_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteListViewBody(),
      floatingActionButton: CustomFloatingButton(),
    );
  }
}
