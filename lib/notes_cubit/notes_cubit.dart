import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

import '../constant.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? filteredNoteList;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  searchNote(String search) {
    filteredNoteList =
        notes!.where((s) => s.title.contains(search)).toList()+
            notes!.where((s) => s.content.contains(search)).toList();;
    emit(NotesSuccess());
  }
}