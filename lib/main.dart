import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constant.dart';
import 'models/note_model.dart';
import 'notes_cubit/notes_cubit.dart';


  void main() async{

    await Hive.initFlutter();
    Bloc.observer=SimpleBlocObserver();
    Hive.registerAdapter(NoteModelAdapter()); // must before open box
    await Hive.openBox<NoteModel>(kNotesBox);
    runApp(const NotesApp());
  }

  class NotesApp extends StatelessWidget {
    const NotesApp ({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return BlocProvider(
          create: (context)=> NotesCubit(),
          child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  brightness: Brightness.dark,
                  fontFamily: 'Poppins',
                  primaryColor: kPrimaryColor,
          ),
            home:const NotesView(),

        ),
      );

    }
  }
