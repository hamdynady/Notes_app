import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubit/note_cubit/note_cubit.dart';
import 'package:notes/models/note_view_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  /* Using a BlocObserver allows you to observe and handle events, transitions,
     and errors across all Blocs and Cubits within your Flutter application.
     This can be useful for logging, debugging, and analytics.*/
  Bloc.observer = SimpleBlocObserver();
  //Register typeAdapter
  Hive.registerAdapter(NoteViewModelAdapter());
  await Hive.openBox<NoteViewModel>(kNotesBox);

  runApp(const Notes());
}

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  NoteViewModel? notes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Notes',
        routes: {
          HomeView.id: (context) => const HomeView(),
        },
        initialRoute: HomeView.id,
        theme: ThemeData.dark(),
        home: const HomeView(),
      ),
    );
  }
}
